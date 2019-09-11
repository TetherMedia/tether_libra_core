import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:tether_libra_core/src/generated/transaction.pb.dart' as GrpcTransaction;
import 'package:tether_libra_core/src/transaction/errors.dart';
import 'package:tether_libra_core/src/transaction/transaction.dart';
import 'package:tether_libra_core/types/account_state.dart';

import '../generated/vm_errors.pb.dart';

class PathValues {
  // in order to not recompute path values hashes, I decided to store the hashes as constants
  static String AccountStatePath = '01217da6c6b3e19f1825cfb2676daecce3bf3de03cf26647c78df00b371b25cc97';
}

class ClientDecoder {


  AccountState decodeAccountStateBlob(Uint8List blob) {
    var buffer = blob.buffer;
    var bdata = ByteData.view(buffer);

    Map<String,Uint8List> state = Map<String, Uint8List>();

    int cursor = 0;
    var blobLen = bdata.getUint32(cursor, Endian.little);
    cursor+=4;

    for (int i = 0; i < blobLen; i++) {
      var keyLen = bdata.getUint32(cursor, Endian.little);
      cursor += 4;

      // Copy not view
      var keyBuffer = Uint8List.fromList(buffer.asUint8List(cursor,keyLen));
      cursor += keyLen;

      var valueLen = bdata.getUint32(cursor, Endian.little);
      cursor += 4;

      var valueBuffer = buffer.asUint8List(cursor,valueLen);
      cursor += valueLen;

      // Make a copy of the buffer, not a view of the parent buffer
      // If we don't copy, the view.buffer points to the parent views buffer, which isn't what we expect
      // when we try to read from the view.buffer as a byte stream.  The offset value is not-intuitive
      state[hex.encode(keyBuffer)] = Uint8List.fromList(valueBuffer);
    }

    return AccountState.fromBytes(state[PathValues.AccountStatePath]);
  }


  LibraSignedTransactionWithProof decodeSignedTransactionWithProof(GrpcTransaction.SignedTransactionWithProof signedTransactionWP  ) {
    // decode transaction
    var signedTransaction = signedTransactionWP.signedTransaction;
    LibraTransaction libraTransaction = decodeRawTransactionBytes(Uint8List.fromList(signedTransaction.rawTxnBytes));

    var libraSignedtransaction = LibraSignedTransaction(
      libraTransaction,
      Uint8List.fromList(signedTransaction.senderPublicKey),
      Uint8List.fromList(signedTransaction.senderSignature),
    );

    // decode event
    List<LibraTransactionEvent> eventsList = List();
    if (signedTransactionWP.hasEvents()) {
      var events = signedTransactionWP.events;
      events.events.forEach((event) {

        Uint8List key;
        if (event.hasKey()){
          key = Uint8List.fromList(event.key);
        }

        eventsList.add( LibraTransactionEvent(
          Uint8List.fromList(event.eventData),
          BigInt.parse(event.sequenceNumber.toString()),
          key
        ));
      });
    }

    return LibraSignedTransactionWithProof(
        libraSignedtransaction,
        signedTransactionWP.proof,
        eventsList);
  }

  LibraTransaction decodeRawTransactionBytes(Uint8List rawTxnBytes)  {
    var rawTxn = GrpcTransaction.RawTransaction.fromBuffer(rawTxnBytes);
    var rawProgram = rawTxn.program;

    LibraProgram program = LibraProgram()
    ..code = Uint8List.fromList(rawProgram.code);

    rawProgram.modules.forEach( (module) {
      program.modules.add(Uint8List.fromList(module));
    });

    program.arguments = [];
    rawProgram.arguments.forEach((argument){
      program.arguments.add(
          LibraProgramArgument()
            ..value = Uint8List.fromList(argument.data)
            ..type = LibraProgramArgumentType.values[argument.type.value]
      );
    });


    LibraGasConstraint gasConstraint = LibraGasConstraint()
      ..gasUnitPrice = BigInt.parse(rawTxn.gasUnitPrice.toString())
      ..maxGasAmount = BigInt.parse(rawTxn.maxGasAmount.toString());

    return LibraTransaction(
      program,
      gasConstraint,
      BigInt.parse(rawTxn.expirationTime.toString()),
      Uint8List.fromList(rawTxn.senderAccount),
      rawTxn.sequenceNumber.toString(),
    );
  }

  LibraVMStatusError decodeVMStatus(VMStatus vmStatus) {
    if (vmStatus == null){
      return null;
    }
    LibraValidationStatusError validationStatus = LibraValidationStatusError();
    List<LibraVerificationStatusError> verificationStatusErrors = List();
    LibraInvariantViolationError invariantViolationError;
    LibraDeserializationError deserializationError;
    LibraExecutionError executionError = LibraExecutionError();

    if (vmStatus.hasValidation()) {
      var validation = vmStatus.validation;
      validationStatus.message = validation.message;
      validationStatus.code = LibraValidationStatusCode.values[validation.code.value];
    }
    if (vmStatus.hasVerification()) {
      var verification = vmStatus.verification;
      verification.statusList.forEach((status){
        verificationStatusErrors.add(
          LibraVerificationStatusError(
            LibraVerificationStatusKind.values[status.statusKind.value],
            status.moduleIdx,
            LibraVerificationError.values[status.errorKind.value],
            status.message)
        );
      });
    }
    if (vmStatus.hasInvariantViolation()) {
      var invariant = vmStatus.invariantViolation;
      invariantViolationError =  LibraInvariantViolationError.values[invariant.value];
    }
    if (vmStatus.hasDeserialization()) {
      var deser = vmStatus.deserialization;
      deserializationError = LibraDeserializationError.values[deser.value];
    }
    if (vmStatus.hasExecution()) {
      var execution = vmStatus.execution;
      executionError.errorType = LibraExecutionErrorType.values[execution.whichExecutionStatus().index];
    }
    return LibraVMStatusError(
      LibraErrorType.values[vmStatus.whichErrorType().index],
      validationStatus,
      verificationStatusErrors,
      invariantViolationError,
      deserializationError,
      executionError,
    );


  }
}