///
//  Generated code. Do not modify.
//  source: libra_access.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

const BalanceRequest$json = const {
  '1': 'BalanceRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

const BalanceResponse$json = const {
  '1': 'BalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 9, '10': 'balance'},
  ],
};

const SignedBuffer$json = const {
  '1': 'SignedBuffer',
  '2': const [
    const {'1': 'buffer', '3': 1, '4': 1, '5': 9, '10': 'buffer'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
  ],
};

const CreateTransferTransaction$json = const {
  '1': 'CreateTransferTransaction',
  '2': const [
    const {'1': 'fromAddress', '3': 1, '4': 1, '5': 9, '10': 'fromAddress'},
    const {'1': 'mnemonicAddress', '3': 2, '4': 1, '5': 9, '10': 'mnemonicAddress'},
    const {'1': 'toAddress', '3': 3, '4': 1, '5': 9, '10': 'toAddress'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
  ],
};

const TransferRequest$json = const {
  '1': 'TransferRequest',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
    const {'1': 'transfer', '3': 2, '4': 1, '5': 11, '6': '.com.tethermedia.grpc.access.libra.CreateTransferTransaction', '9': 0, '10': 'transfer'},
    const {'1': 'signed', '3': 3, '4': 1, '5': 11, '6': '.com.tethermedia.grpc.access.libra.SignedBuffer', '9': 0, '10': 'signed'},
  ],
  '8': const [
    const {'1': 'request'},
  ],
};

const SignatureNeeded$json = const {
  '1': 'SignatureNeeded',
  '2': const [
    const {'1': 'buffer', '3': 1, '4': 1, '5': 9, '10': 'buffer'},
  ],
};

const TransferCompleted$json = const {
  '1': 'TransferCompleted',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 9, '10': 'toAddress'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 9, '10': 'amount'},
  ],
};

const TransferResponse$json = const {
  '1': 'TransferResponse',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.com.tethermedia.grpc.access.libra.TransferCompleted', '9': 0, '10': 'result'},
    const {'1': 'toSign', '3': 3, '4': 1, '5': 11, '6': '.com.tethermedia.grpc.access.libra.SignatureNeeded', '9': 0, '10': 'toSign'},
  ],
  '8': const [
    const {'1': 'request'},
  ],
};

