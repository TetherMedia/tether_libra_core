///
//  Generated code. Do not modify.
//  source: mempool.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction.pb.dart' as $9;
import 'mempool_status.pb.dart' as $12;

class AddTransactionWithValidationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddTransactionWithValidationRequest', package: const $pb.PackageName('mempool'))
    ..a<$9.SignedTransaction>(1, 'signedTxn', $pb.PbFieldType.OM, $9.SignedTransaction.getDefault, $9.SignedTransaction.create)
    ..a<Int64>(2, 'maxGasCost', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(3, 'latestSequenceNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(4, 'accountBalance', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  AddTransactionWithValidationRequest() : super();
  AddTransactionWithValidationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AddTransactionWithValidationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AddTransactionWithValidationRequest clone() => AddTransactionWithValidationRequest()..mergeFromMessage(this);
  AddTransactionWithValidationRequest copyWith(void Function(AddTransactionWithValidationRequest) updates) => super.copyWith((message) => updates(message as AddTransactionWithValidationRequest));
  $pb.BuilderInfo get info_ => _i;
  static AddTransactionWithValidationRequest create() => AddTransactionWithValidationRequest();
  AddTransactionWithValidationRequest createEmptyInstance() => create();
  static $pb.PbList<AddTransactionWithValidationRequest> createRepeated() => $pb.PbList<AddTransactionWithValidationRequest>();
  static AddTransactionWithValidationRequest getDefault() => _defaultInstance ??= create()..freeze();
  static AddTransactionWithValidationRequest _defaultInstance;

  $9.SignedTransaction get signedTxn => $_getN(0);
  set signedTxn($9.SignedTransaction v) { setField(1, v); }
  $core.bool hasSignedTxn() => $_has(0);
  void clearSignedTxn() => clearField(1);

  Int64 get maxGasCost => $_getI64(1);
  set maxGasCost(Int64 v) { $_setInt64(1, v); }
  $core.bool hasMaxGasCost() => $_has(1);
  void clearMaxGasCost() => clearField(2);

  Int64 get latestSequenceNumber => $_getI64(2);
  set latestSequenceNumber(Int64 v) { $_setInt64(2, v); }
  $core.bool hasLatestSequenceNumber() => $_has(2);
  void clearLatestSequenceNumber() => clearField(3);

  Int64 get accountBalance => $_getI64(3);
  set accountBalance(Int64 v) { $_setInt64(3, v); }
  $core.bool hasAccountBalance() => $_has(3);
  void clearAccountBalance() => clearField(4);
}

class AddTransactionWithValidationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddTransactionWithValidationResponse', package: const $pb.PackageName('mempool'))
    ..a<Int64>(1, 'currentVersion', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<$12.MempoolAddTransactionStatus>(2, 'status', $pb.PbFieldType.OM, $12.MempoolAddTransactionStatus.getDefault, $12.MempoolAddTransactionStatus.create)
    ..hasRequiredFields = false
  ;

  AddTransactionWithValidationResponse() : super();
  AddTransactionWithValidationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AddTransactionWithValidationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AddTransactionWithValidationResponse clone() => AddTransactionWithValidationResponse()..mergeFromMessage(this);
  AddTransactionWithValidationResponse copyWith(void Function(AddTransactionWithValidationResponse) updates) => super.copyWith((message) => updates(message as AddTransactionWithValidationResponse));
  $pb.BuilderInfo get info_ => _i;
  static AddTransactionWithValidationResponse create() => AddTransactionWithValidationResponse();
  AddTransactionWithValidationResponse createEmptyInstance() => create();
  static $pb.PbList<AddTransactionWithValidationResponse> createRepeated() => $pb.PbList<AddTransactionWithValidationResponse>();
  static AddTransactionWithValidationResponse getDefault() => _defaultInstance ??= create()..freeze();
  static AddTransactionWithValidationResponse _defaultInstance;

  Int64 get currentVersion => $_getI64(0);
  set currentVersion(Int64 v) { $_setInt64(0, v); }
  $core.bool hasCurrentVersion() => $_has(0);
  void clearCurrentVersion() => clearField(1);

  $12.MempoolAddTransactionStatus get status => $_getN(1);
  set status($12.MempoolAddTransactionStatus v) { setField(2, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);
}

class GetBlockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockRequest', package: const $pb.PackageName('mempool'))
    ..a<Int64>(1, 'maxBlockSize', $pb.PbFieldType.OU6, Int64.ZERO)
    ..pc<TransactionExclusion>(2, 'transactions', $pb.PbFieldType.PM,TransactionExclusion.create)
    ..hasRequiredFields = false
  ;

  GetBlockRequest() : super();
  GetBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetBlockRequest clone() => GetBlockRequest()..mergeFromMessage(this);
  GetBlockRequest copyWith(void Function(GetBlockRequest) updates) => super.copyWith((message) => updates(message as GetBlockRequest));
  $pb.BuilderInfo get info_ => _i;
  static GetBlockRequest create() => GetBlockRequest();
  GetBlockRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockRequest> createRepeated() => $pb.PbList<GetBlockRequest>();
  static GetBlockRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetBlockRequest _defaultInstance;

  Int64 get maxBlockSize => $_getI64(0);
  set maxBlockSize(Int64 v) { $_setInt64(0, v); }
  $core.bool hasMaxBlockSize() => $_has(0);
  void clearMaxBlockSize() => clearField(1);

  $core.List<TransactionExclusion> get transactions => $_getList(1);
}

class GetBlockResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockResponse', package: const $pb.PackageName('mempool'))
    ..a<$9.SignedTransactionsBlock>(1, 'block', $pb.PbFieldType.OM, $9.SignedTransactionsBlock.getDefault, $9.SignedTransactionsBlock.create)
    ..hasRequiredFields = false
  ;

  GetBlockResponse() : super();
  GetBlockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetBlockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetBlockResponse clone() => GetBlockResponse()..mergeFromMessage(this);
  GetBlockResponse copyWith(void Function(GetBlockResponse) updates) => super.copyWith((message) => updates(message as GetBlockResponse));
  $pb.BuilderInfo get info_ => _i;
  static GetBlockResponse create() => GetBlockResponse();
  GetBlockResponse createEmptyInstance() => create();
  static $pb.PbList<GetBlockResponse> createRepeated() => $pb.PbList<GetBlockResponse>();
  static GetBlockResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetBlockResponse _defaultInstance;

  $9.SignedTransactionsBlock get block => $_getN(0);
  set block($9.SignedTransactionsBlock v) { setField(1, v); }
  $core.bool hasBlock() => $_has(0);
  void clearBlock() => clearField(1);
}

class TransactionExclusion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionExclusion', package: const $pb.PackageName('mempool'))
    ..a<$core.List<$core.int>>(1, 'sender', $pb.PbFieldType.OY)
    ..a<Int64>(2, 'sequenceNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  TransactionExclusion() : super();
  TransactionExclusion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransactionExclusion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransactionExclusion clone() => TransactionExclusion()..mergeFromMessage(this);
  TransactionExclusion copyWith(void Function(TransactionExclusion) updates) => super.copyWith((message) => updates(message as TransactionExclusion));
  $pb.BuilderInfo get info_ => _i;
  static TransactionExclusion create() => TransactionExclusion();
  TransactionExclusion createEmptyInstance() => create();
  static $pb.PbList<TransactionExclusion> createRepeated() => $pb.PbList<TransactionExclusion>();
  static TransactionExclusion getDefault() => _defaultInstance ??= create()..freeze();
  static TransactionExclusion _defaultInstance;

  $core.List<$core.int> get sender => $_getN(0);
  set sender($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasSender() => $_has(0);
  void clearSender() => clearField(1);

  Int64 get sequenceNumber => $_getI64(1);
  set sequenceNumber(Int64 v) { $_setInt64(1, v); }
  $core.bool hasSequenceNumber() => $_has(1);
  void clearSequenceNumber() => clearField(2);
}

class CommitTransactionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CommitTransactionsRequest', package: const $pb.PackageName('mempool'))
    ..pc<CommittedTransaction>(1, 'transactions', $pb.PbFieldType.PM,CommittedTransaction.create)
    ..a<Int64>(2, 'blockTimestampUsecs', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  CommitTransactionsRequest() : super();
  CommitTransactionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CommitTransactionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CommitTransactionsRequest clone() => CommitTransactionsRequest()..mergeFromMessage(this);
  CommitTransactionsRequest copyWith(void Function(CommitTransactionsRequest) updates) => super.copyWith((message) => updates(message as CommitTransactionsRequest));
  $pb.BuilderInfo get info_ => _i;
  static CommitTransactionsRequest create() => CommitTransactionsRequest();
  CommitTransactionsRequest createEmptyInstance() => create();
  static $pb.PbList<CommitTransactionsRequest> createRepeated() => $pb.PbList<CommitTransactionsRequest>();
  static CommitTransactionsRequest getDefault() => _defaultInstance ??= create()..freeze();
  static CommitTransactionsRequest _defaultInstance;

  $core.List<CommittedTransaction> get transactions => $_getList(0);

  Int64 get blockTimestampUsecs => $_getI64(1);
  set blockTimestampUsecs(Int64 v) { $_setInt64(1, v); }
  $core.bool hasBlockTimestampUsecs() => $_has(1);
  void clearBlockTimestampUsecs() => clearField(2);
}

class CommitTransactionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CommitTransactionsResponse', package: const $pb.PackageName('mempool'))
    ..hasRequiredFields = false
  ;

  CommitTransactionsResponse() : super();
  CommitTransactionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CommitTransactionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CommitTransactionsResponse clone() => CommitTransactionsResponse()..mergeFromMessage(this);
  CommitTransactionsResponse copyWith(void Function(CommitTransactionsResponse) updates) => super.copyWith((message) => updates(message as CommitTransactionsResponse));
  $pb.BuilderInfo get info_ => _i;
  static CommitTransactionsResponse create() => CommitTransactionsResponse();
  CommitTransactionsResponse createEmptyInstance() => create();
  static $pb.PbList<CommitTransactionsResponse> createRepeated() => $pb.PbList<CommitTransactionsResponse>();
  static CommitTransactionsResponse getDefault() => _defaultInstance ??= create()..freeze();
  static CommitTransactionsResponse _defaultInstance;
}

class CommittedTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CommittedTransaction', package: const $pb.PackageName('mempool'))
    ..a<$core.List<$core.int>>(1, 'sender', $pb.PbFieldType.OY)
    ..a<Int64>(2, 'sequenceNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOB(3, 'isRejected')
    ..hasRequiredFields = false
  ;

  CommittedTransaction() : super();
  CommittedTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CommittedTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CommittedTransaction clone() => CommittedTransaction()..mergeFromMessage(this);
  CommittedTransaction copyWith(void Function(CommittedTransaction) updates) => super.copyWith((message) => updates(message as CommittedTransaction));
  $pb.BuilderInfo get info_ => _i;
  static CommittedTransaction create() => CommittedTransaction();
  CommittedTransaction createEmptyInstance() => create();
  static $pb.PbList<CommittedTransaction> createRepeated() => $pb.PbList<CommittedTransaction>();
  static CommittedTransaction getDefault() => _defaultInstance ??= create()..freeze();
  static CommittedTransaction _defaultInstance;

  $core.List<$core.int> get sender => $_getN(0);
  set sender($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasSender() => $_has(0);
  void clearSender() => clearField(1);

  Int64 get sequenceNumber => $_getI64(1);
  set sequenceNumber(Int64 v) { $_setInt64(1, v); }
  $core.bool hasSequenceNumber() => $_has(1);
  void clearSequenceNumber() => clearField(2);

  $core.bool get isRejected => $_get(2, false);
  set isRejected($core.bool v) { $_setBool(2, v); }
  $core.bool hasIsRejected() => $_has(2);
  void clearIsRejected() => clearField(3);
}

class HealthCheckRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HealthCheckRequest', package: const $pb.PackageName('mempool'))
    ..hasRequiredFields = false
  ;

  HealthCheckRequest() : super();
  HealthCheckRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HealthCheckRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HealthCheckRequest clone() => HealthCheckRequest()..mergeFromMessage(this);
  HealthCheckRequest copyWith(void Function(HealthCheckRequest) updates) => super.copyWith((message) => updates(message as HealthCheckRequest));
  $pb.BuilderInfo get info_ => _i;
  static HealthCheckRequest create() => HealthCheckRequest();
  HealthCheckRequest createEmptyInstance() => create();
  static $pb.PbList<HealthCheckRequest> createRepeated() => $pb.PbList<HealthCheckRequest>();
  static HealthCheckRequest getDefault() => _defaultInstance ??= create()..freeze();
  static HealthCheckRequest _defaultInstance;
}

class HealthCheckResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HealthCheckResponse', package: const $pb.PackageName('mempool'))
    ..aOB(1, 'isHealthy')
    ..hasRequiredFields = false
  ;

  HealthCheckResponse() : super();
  HealthCheckResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HealthCheckResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HealthCheckResponse clone() => HealthCheckResponse()..mergeFromMessage(this);
  HealthCheckResponse copyWith(void Function(HealthCheckResponse) updates) => super.copyWith((message) => updates(message as HealthCheckResponse));
  $pb.BuilderInfo get info_ => _i;
  static HealthCheckResponse create() => HealthCheckResponse();
  HealthCheckResponse createEmptyInstance() => create();
  static $pb.PbList<HealthCheckResponse> createRepeated() => $pb.PbList<HealthCheckResponse>();
  static HealthCheckResponse getDefault() => _defaultInstance ??= create()..freeze();
  static HealthCheckResponse _defaultInstance;

  $core.bool get isHealthy => $_get(0, false);
  set isHealthy($core.bool v) { $_setBool(0, v); }
  $core.bool hasIsHealthy() => $_has(0);
  void clearIsHealthy() => clearField(1);
}

