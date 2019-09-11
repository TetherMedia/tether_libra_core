///
//  Generated code. Do not modify.
//  source: libra_access.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

class BalanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BalanceRequest', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'address')
    ..hasRequiredFields = false
  ;

  BalanceRequest() : super();
  BalanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BalanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BalanceRequest clone() => BalanceRequest()..mergeFromMessage(this);
  BalanceRequest copyWith(void Function(BalanceRequest) updates) => super.copyWith((message) => updates(message as BalanceRequest));
  $pb.BuilderInfo get info_ => _i;
  static BalanceRequest create() => BalanceRequest();
  BalanceRequest createEmptyInstance() => create();
  static $pb.PbList<BalanceRequest> createRepeated() => $pb.PbList<BalanceRequest>();
  static BalanceRequest getDefault() => _defaultInstance ??= create()..freeze();
  static BalanceRequest _defaultInstance;

  $core.String get address => $_getS(0, '');
  set address($core.String v) { $_setString(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);
}

class BalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BalanceResponse', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'balance')
    ..hasRequiredFields = false
  ;

  BalanceResponse() : super();
  BalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BalanceResponse clone() => BalanceResponse()..mergeFromMessage(this);
  BalanceResponse copyWith(void Function(BalanceResponse) updates) => super.copyWith((message) => updates(message as BalanceResponse));
  $pb.BuilderInfo get info_ => _i;
  static BalanceResponse create() => BalanceResponse();
  BalanceResponse createEmptyInstance() => create();
  static $pb.PbList<BalanceResponse> createRepeated() => $pb.PbList<BalanceResponse>();
  static BalanceResponse getDefault() => _defaultInstance ??= create()..freeze();
  static BalanceResponse _defaultInstance;

  $core.String get balance => $_getS(0, '');
  set balance($core.String v) { $_setString(0, v); }
  $core.bool hasBalance() => $_has(0);
  void clearBalance() => clearField(1);
}

class SignedBuffer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignedBuffer', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'buffer')
    ..aOS(2, 'signature')
    ..hasRequiredFields = false
  ;

  SignedBuffer() : super();
  SignedBuffer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignedBuffer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignedBuffer clone() => SignedBuffer()..mergeFromMessage(this);
  SignedBuffer copyWith(void Function(SignedBuffer) updates) => super.copyWith((message) => updates(message as SignedBuffer));
  $pb.BuilderInfo get info_ => _i;
  static SignedBuffer create() => SignedBuffer();
  SignedBuffer createEmptyInstance() => create();
  static $pb.PbList<SignedBuffer> createRepeated() => $pb.PbList<SignedBuffer>();
  static SignedBuffer getDefault() => _defaultInstance ??= create()..freeze();
  static SignedBuffer _defaultInstance;

  $core.String get buffer => $_getS(0, '');
  set buffer($core.String v) { $_setString(0, v); }
  $core.bool hasBuffer() => $_has(0);
  void clearBuffer() => clearField(1);

  $core.String get signature => $_getS(1, '');
  set signature($core.String v) { $_setString(1, v); }
  $core.bool hasSignature() => $_has(1);
  void clearSignature() => clearField(2);
}

class CreateTransferTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateTransferTransaction', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'fromAddress')
    ..aOS(2, 'mnemonicAddress')
    ..aOS(3, 'toAddress')
    ..aOS(4, 'amount')
    ..hasRequiredFields = false
  ;

  CreateTransferTransaction() : super();
  CreateTransferTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CreateTransferTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CreateTransferTransaction clone() => CreateTransferTransaction()..mergeFromMessage(this);
  CreateTransferTransaction copyWith(void Function(CreateTransferTransaction) updates) => super.copyWith((message) => updates(message as CreateTransferTransaction));
  $pb.BuilderInfo get info_ => _i;
  static CreateTransferTransaction create() => CreateTransferTransaction();
  CreateTransferTransaction createEmptyInstance() => create();
  static $pb.PbList<CreateTransferTransaction> createRepeated() => $pb.PbList<CreateTransferTransaction>();
  static CreateTransferTransaction getDefault() => _defaultInstance ??= create()..freeze();
  static CreateTransferTransaction _defaultInstance;

  $core.String get fromAddress => $_getS(0, '');
  set fromAddress($core.String v) { $_setString(0, v); }
  $core.bool hasFromAddress() => $_has(0);
  void clearFromAddress() => clearField(1);

  $core.String get mnemonicAddress => $_getS(1, '');
  set mnemonicAddress($core.String v) { $_setString(1, v); }
  $core.bool hasMnemonicAddress() => $_has(1);
  void clearMnemonicAddress() => clearField(2);

  $core.String get toAddress => $_getS(2, '');
  set toAddress($core.String v) { $_setString(2, v); }
  $core.bool hasToAddress() => $_has(2);
  void clearToAddress() => clearField(3);

  $core.String get amount => $_getS(3, '');
  set amount($core.String v) { $_setString(3, v); }
  $core.bool hasAmount() => $_has(3);
  void clearAmount() => clearField(4);
}

enum TransferRequest_Request {
  transfer, 
  signed, 
  notSet
}

class TransferRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TransferRequest_Request> _TransferRequest_RequestByTag = {
    2 : TransferRequest_Request.transfer,
    3 : TransferRequest_Request.signed,
    0 : TransferRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferRequest', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'transactionId')
    ..a<CreateTransferTransaction>(2, 'transfer', $pb.PbFieldType.OM, CreateTransferTransaction.getDefault, CreateTransferTransaction.create)
    ..a<SignedBuffer>(3, 'signed', $pb.PbFieldType.OM, SignedBuffer.getDefault, SignedBuffer.create)
    ..oo(0, [2, 3])
    ..hasRequiredFields = false
  ;

  TransferRequest() : super();
  TransferRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransferRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransferRequest clone() => TransferRequest()..mergeFromMessage(this);
  TransferRequest copyWith(void Function(TransferRequest) updates) => super.copyWith((message) => updates(message as TransferRequest));
  $pb.BuilderInfo get info_ => _i;
  static TransferRequest create() => TransferRequest();
  TransferRequest createEmptyInstance() => create();
  static $pb.PbList<TransferRequest> createRepeated() => $pb.PbList<TransferRequest>();
  static TransferRequest getDefault() => _defaultInstance ??= create()..freeze();
  static TransferRequest _defaultInstance;

  TransferRequest_Request whichRequest() => _TransferRequest_RequestByTag[$_whichOneof(0)];
  void clearRequest() => clearField($_whichOneof(0));

  $core.String get transactionId => $_getS(0, '');
  set transactionId($core.String v) { $_setString(0, v); }
  $core.bool hasTransactionId() => $_has(0);
  void clearTransactionId() => clearField(1);

  CreateTransferTransaction get transfer => $_getN(1);
  set transfer(CreateTransferTransaction v) { setField(2, v); }
  $core.bool hasTransfer() => $_has(1);
  void clearTransfer() => clearField(2);

  SignedBuffer get signed => $_getN(2);
  set signed(SignedBuffer v) { setField(3, v); }
  $core.bool hasSigned() => $_has(2);
  void clearSigned() => clearField(3);
}

class SignatureNeeded extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignatureNeeded', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'buffer')
    ..hasRequiredFields = false
  ;

  SignatureNeeded() : super();
  SignatureNeeded.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignatureNeeded.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignatureNeeded clone() => SignatureNeeded()..mergeFromMessage(this);
  SignatureNeeded copyWith(void Function(SignatureNeeded) updates) => super.copyWith((message) => updates(message as SignatureNeeded));
  $pb.BuilderInfo get info_ => _i;
  static SignatureNeeded create() => SignatureNeeded();
  SignatureNeeded createEmptyInstance() => create();
  static $pb.PbList<SignatureNeeded> createRepeated() => $pb.PbList<SignatureNeeded>();
  static SignatureNeeded getDefault() => _defaultInstance ??= create()..freeze();
  static SignatureNeeded _defaultInstance;

  $core.String get buffer => $_getS(0, '');
  set buffer($core.String v) { $_setString(0, v); }
  $core.bool hasBuffer() => $_has(0);
  void clearBuffer() => clearField(1);
}

class TransferCompleted extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferCompleted', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'address')
    ..aOS(2, 'toAddress')
    ..aOS(3, 'amount')
    ..hasRequiredFields = false
  ;

  TransferCompleted() : super();
  TransferCompleted.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransferCompleted.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransferCompleted clone() => TransferCompleted()..mergeFromMessage(this);
  TransferCompleted copyWith(void Function(TransferCompleted) updates) => super.copyWith((message) => updates(message as TransferCompleted));
  $pb.BuilderInfo get info_ => _i;
  static TransferCompleted create() => TransferCompleted();
  TransferCompleted createEmptyInstance() => create();
  static $pb.PbList<TransferCompleted> createRepeated() => $pb.PbList<TransferCompleted>();
  static TransferCompleted getDefault() => _defaultInstance ??= create()..freeze();
  static TransferCompleted _defaultInstance;

  $core.String get address => $_getS(0, '');
  set address($core.String v) { $_setString(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);

  $core.String get toAddress => $_getS(1, '');
  set toAddress($core.String v) { $_setString(1, v); }
  $core.bool hasToAddress() => $_has(1);
  void clearToAddress() => clearField(2);

  $core.String get amount => $_getS(2, '');
  set amount($core.String v) { $_setString(2, v); }
  $core.bool hasAmount() => $_has(2);
  void clearAmount() => clearField(3);
}

enum TransferResponse_Request {
  result, 
  toSign, 
  notSet
}

class TransferResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TransferResponse_Request> _TransferResponse_RequestByTag = {
    2 : TransferResponse_Request.result,
    3 : TransferResponse_Request.toSign,
    0 : TransferResponse_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferResponse', package: const $pb.PackageName('com.tethermedia.grpc.access.libra'))
    ..aOS(1, 'transactionId')
    ..a<TransferCompleted>(2, 'result', $pb.PbFieldType.OM, TransferCompleted.getDefault, TransferCompleted.create)
    ..a<SignatureNeeded>(3, 'toSign', $pb.PbFieldType.OM, SignatureNeeded.getDefault, SignatureNeeded.create)
    ..oo(0, [2, 3])
    ..hasRequiredFields = false
  ;

  TransferResponse() : super();
  TransferResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransferResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransferResponse clone() => TransferResponse()..mergeFromMessage(this);
  TransferResponse copyWith(void Function(TransferResponse) updates) => super.copyWith((message) => updates(message as TransferResponse));
  $pb.BuilderInfo get info_ => _i;
  static TransferResponse create() => TransferResponse();
  TransferResponse createEmptyInstance() => create();
  static $pb.PbList<TransferResponse> createRepeated() => $pb.PbList<TransferResponse>();
  static TransferResponse getDefault() => _defaultInstance ??= create()..freeze();
  static TransferResponse _defaultInstance;

  TransferResponse_Request whichRequest() => _TransferResponse_RequestByTag[$_whichOneof(0)];
  void clearRequest() => clearField($_whichOneof(0));

  $core.String get transactionId => $_getS(0, '');
  set transactionId($core.String v) { $_setString(0, v); }
  $core.bool hasTransactionId() => $_has(0);
  void clearTransactionId() => clearField(1);

  TransferCompleted get result => $_getN(1);
  set result(TransferCompleted v) { setField(2, v); }
  $core.bool hasResult() => $_has(1);
  void clearResult() => clearField(2);

  SignatureNeeded get toSign => $_getN(2);
  set toSign(SignatureNeeded v) { setField(3, v); }
  $core.bool hasToSign() => $_has(2);
  void clearToSign() => clearField(3);
}

