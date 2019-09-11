import 'package:tether_libra_core/src/transaction/transaction.dart';
import 'package:tether_libra_core/src/wallet/account_address.dart';
import '../generated/transaction.pb.dart';
import './libra_client.dart';
import 'package:fixnum/fixnum.dart';


class ClientEncoder {

  Future<RawTransaction> encodeLibraTransaction( LibraClient _client, LibraTransaction transaction,  AccountAddress senderAccountAddress) async {
    var senderAddress = transaction.sendersAddress;
    if (senderAddress.isDefault()) {
      senderAddress = senderAccountAddress;
    }
    BigInt sequenceNumber = transaction.sequenceNumber;
    if (sequenceNumber.isNegative) {
      final senderAccountState = await _client.getAccountState(senderAddress.toHex());
      sequenceNumber = senderAccountState.sequenceNumber;
    }

    final program = Program();
    program.code = transaction.program.code;

    transaction.program.arguments.forEach((argument) {
      final transactionArgument = TransactionArgument();
      // Use the index to convert one enum to the other
      transactionArgument.type = TransactionArgument_ArgType.values[argument.type.index];
      transactionArgument.data = argument.value;
      program.arguments.add(transactionArgument);
    });

    program.modules.clear();
    program.modules.addAll(transaction.program.modules.toList());

    final rawTransaction = RawTransaction();

    rawTransaction.expirationTime = Int64.parseInt(transaction.expirationTime.toString());
    rawTransaction.gasUnitPrice = Int64.parseInt(transaction.gasConstraint.gasUnitPrice.toString());
    rawTransaction.maxGasAmount = Int64.parseInt(transaction.gasConstraint.maxGasAmount.toString());
    rawTransaction.sequenceNumber =  Int64.parseInt(sequenceNumber.toString());
    rawTransaction.program = program;
    rawTransaction.senderAccount = senderAddress.address.toList();


    return rawTransaction;
  }
}

