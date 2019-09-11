import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:tether_libra_core/src/client/libra_client.dart';
import 'package:tether_libra_core/src/generated/proof.pb.dart';
import 'package:tether_libra_core/src/transaction/program_base64_codes.dart';
import 'package:tether_libra_core/src/wallet/account_address.dart';
import 'dart:typed_data';

import 'errors.dart';

enum LibraProgramArgumentType {
  U64,      // 0
  ADDRESS,  // 1,
  STRING,   // 2,
  BYTEARRAY // 3,
}

class LibraProgramArgument {
  LibraProgramArgumentType type;
  Uint8List value;
}

class LibraProgram {
  Uint8List code;
  List <LibraProgramArgument> arguments;
  List<Uint8List> modules;
}

class LibraGasConstraint {
  BigInt maxGasAmount;
  BigInt gasUnitPrice;
}


class LibraTransaction {
  // NOTE: Ensure this raw bytes is always set used internally
  LibraProgram program;
  LibraGasConstraint gasConstraint;
  BigInt expirationTime;
  AccountAddress sendersAddress;
  BigInt sequenceNumber;

  LibraTransaction(this.program, this.gasConstraint, dynamic expirationTime, Uint8List sendersAddress, dynamic sequenceNumber) {
    this.sendersAddress = AccountAddress(sendersAddress);
    this.expirationTime = _setBigInt(expirationTime);
    this.sequenceNumber = _setBigInt(sequenceNumber);
  }

  static LibraTransaction createTransfer(String recipientAddress, BigInt numAccount)  {
    var amount = Uint8List(8);
    var amountBuffer = amount.buffer;
    var bdata = ByteData.view(amountBuffer);

    bdata.setUint64(0, numAccount.toInt(), Endian.little);

    List<LibraProgramArgument> programArguments = List<LibraProgramArgument>();
    programArguments.add( LibraProgramArgument()
        ..type = LibraProgramArgumentType.ADDRESS
        ..value = Uint8List.fromList(hex.decode(recipientAddress))
    );

    programArguments.add( LibraProgramArgument()
        ..type = LibraProgramArgumentType.U64
        ..value = amount
    );
    LibraProgram program = LibraProgram()
      ..arguments = programArguments
      ..modules = List()
      ..code = Uint8List.fromList((base64.decode(ProgamBase64Codes.peerToPeerTxn)));

    int timestamp = ((DateTime.now().millisecondsSinceEpoch/1000) + 100).floor();
    return LibraTransaction(
        program,
        LibraGasConstraint()..gasUnitPrice=BigInt.zero..maxGasAmount=BigInt.from(1000000),
        '$timestamp',
        Uint8List.fromList(hex.decode(AccountAddress.AssociationAddress)),
      '-1'
    );

  }
}

class LibraTransactionResponse {

  final LibraSignedTransaction signedTransaction;
  final Uint8List validatorId;
  final LibraAdmissionControlStatus acStatus;
  final LibraMempoolTransactionStatus mempoolStatus;
  final LibraVMStatusError vmStatus;


  LibraTransactionResponse(
      this.signedTransaction,
      this.validatorId,
      this.acStatus,
      this.mempoolStatus,
      this.vmStatus);

  @override
  String toString() {
    return 'LibraTransactionResponse{signedTransaction: $signedTransaction, validatorId: $validatorId, acStatus: $acStatus, mempoolStatus: $mempoolStatus, vmStatus: $vmStatus}';
  }

  Future<void> awaitConfirmation(LibraClient client) async {
    return client.waitForConfirmation(
      this.signedTransaction.transaction.sendersAddress.toString(),
      this.signedTransaction.transaction.sequenceNumber+BigInt.one,
      this.signedTransaction.transaction.sequenceNumber,
    );
  }

}
enum LibraAdmissionControlStatus {
  ACCEPTED,     // 0,
  BLACKLISTED,  // 1,
  REJECTED      // 2,
}

enum LibraMempoolTransactionStatus {
  VALID,                // 0,
  INSUFFICIENTBALANCE,  // 1,
  INVALIDSEQNUMBER,     // 2,
  MEMPOOLISFULL,        // 3,
  TOOMANYTRANSACTIONS,  // 4,
  INVALIDUPDATE         // 5,
}

class LibraSignedTransaction {
  final LibraTransaction transaction;
  final Uint8List publicKey;
  final Uint8List signature;

  LibraSignedTransaction(this.transaction, this.publicKey, this.signature);
}

class LibraSignedTransactionWithProof {
  final LibraSignedTransaction signedTransaction;
  final SignedTransactionProof proof;
  final List<LibraTransactionEvent> events;

  LibraSignedTransactionWithProof(this.signedTransaction, this.proof, this.events);
}

// TODO: Implement abstraction over the pb classes for transaction proof
// class LibraSignedTransactionProof extends SignedTransactionProof {}

class LibraTransactionEvent {
  final Uint8List data; // eventData
  final BigInt sequenceNumber;
  final Uint8List eventKey;

  LibraTransactionEvent(this.data, dynamic sequenceNumber, this.eventKey) : this.sequenceNumber =  _setBigInt(sequenceNumber);
}

/// Helper to set a BigInt from an int or string
BigInt _setBigInt(dynamic input){
  if (input is int) {
    return BigInt.from(input);
  } else if (input is BigInt) {
    return input;
  } else if (input is String) {
    return BigInt.parse(input);
  } else {
    throw Exception('Bad data type for sequenceNumber');
  }
}