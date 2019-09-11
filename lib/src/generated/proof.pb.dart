///
//  Generated code. Do not modify.
//  source: proof.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction_info.pb.dart' as $1;

class AccumulatorProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccumulatorProof', package: const $pb.PackageName('types'))
    ..a<Int64>(1, 'bitmap', $pb.PbFieldType.OU6, Int64.ZERO)
    ..p<$core.List<$core.int>>(2, 'nonDefaultSiblings', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  AccumulatorProof() : super();
  AccumulatorProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccumulatorProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccumulatorProof clone() => AccumulatorProof()..mergeFromMessage(this);
  AccumulatorProof copyWith(void Function(AccumulatorProof) updates) => super.copyWith((message) => updates(message as AccumulatorProof));
  $pb.BuilderInfo get info_ => _i;
  static AccumulatorProof create() => AccumulatorProof();
  AccumulatorProof createEmptyInstance() => create();
  static $pb.PbList<AccumulatorProof> createRepeated() => $pb.PbList<AccumulatorProof>();
  static AccumulatorProof getDefault() => _defaultInstance ??= create()..freeze();
  static AccumulatorProof _defaultInstance;

  Int64 get bitmap => $_getI64(0);
  set bitmap(Int64 v) { $_setInt64(0, v); }
  $core.bool hasBitmap() => $_has(0);
  void clearBitmap() => clearField(1);

  $core.List<$core.List<$core.int>> get nonDefaultSiblings => $_getList(1);
}

class SparseMerkleProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SparseMerkleProof', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'leaf', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'bitmap', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, 'nonDefaultSiblings', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  SparseMerkleProof() : super();
  SparseMerkleProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SparseMerkleProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SparseMerkleProof clone() => SparseMerkleProof()..mergeFromMessage(this);
  SparseMerkleProof copyWith(void Function(SparseMerkleProof) updates) => super.copyWith((message) => updates(message as SparseMerkleProof));
  $pb.BuilderInfo get info_ => _i;
  static SparseMerkleProof create() => SparseMerkleProof();
  SparseMerkleProof createEmptyInstance() => create();
  static $pb.PbList<SparseMerkleProof> createRepeated() => $pb.PbList<SparseMerkleProof>();
  static SparseMerkleProof getDefault() => _defaultInstance ??= create()..freeze();
  static SparseMerkleProof _defaultInstance;

  $core.List<$core.int> get leaf => $_getN(0);
  set leaf($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasLeaf() => $_has(0);
  void clearLeaf() => clearField(1);

  $core.List<$core.int> get bitmap => $_getN(1);
  set bitmap($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasBitmap() => $_has(1);
  void clearBitmap() => clearField(2);

  $core.List<$core.List<$core.int>> get nonDefaultSiblings => $_getList(2);
}

class AccumulatorConsistencyProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccumulatorConsistencyProof', package: const $pb.PackageName('types'))
    ..p<$core.List<$core.int>>(1, 'frozenSubtreeRoots', $pb.PbFieldType.PY)
    ..a<$core.int>(2, 'numSiblings', $pb.PbFieldType.OU3)
    ..p<$core.List<$core.int>>(3, 'nonDefaultSiblings', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  AccumulatorConsistencyProof() : super();
  AccumulatorConsistencyProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccumulatorConsistencyProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccumulatorConsistencyProof clone() => AccumulatorConsistencyProof()..mergeFromMessage(this);
  AccumulatorConsistencyProof copyWith(void Function(AccumulatorConsistencyProof) updates) => super.copyWith((message) => updates(message as AccumulatorConsistencyProof));
  $pb.BuilderInfo get info_ => _i;
  static AccumulatorConsistencyProof create() => AccumulatorConsistencyProof();
  AccumulatorConsistencyProof createEmptyInstance() => create();
  static $pb.PbList<AccumulatorConsistencyProof> createRepeated() => $pb.PbList<AccumulatorConsistencyProof>();
  static AccumulatorConsistencyProof getDefault() => _defaultInstance ??= create()..freeze();
  static AccumulatorConsistencyProof _defaultInstance;

  $core.List<$core.List<$core.int>> get frozenSubtreeRoots => $_getList(0);

  $core.int get numSiblings => $_get(1, 0);
  set numSiblings($core.int v) { $_setUnsignedInt32(1, v); }
  $core.bool hasNumSiblings() => $_has(1);
  void clearNumSiblings() => clearField(2);

  $core.List<$core.List<$core.int>> get nonDefaultSiblings => $_getList(2);
}

class SignedTransactionProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignedTransactionProof', package: const $pb.PackageName('types'))
    ..a<AccumulatorProof>(1, 'ledgerInfoToTransactionInfoProof', $pb.PbFieldType.OM, AccumulatorProof.getDefault, AccumulatorProof.create)
    ..a<$1.TransactionInfo>(2, 'transactionInfo', $pb.PbFieldType.OM, $1.TransactionInfo.getDefault, $1.TransactionInfo.create)
    ..hasRequiredFields = false
  ;

  SignedTransactionProof() : super();
  SignedTransactionProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignedTransactionProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignedTransactionProof clone() => SignedTransactionProof()..mergeFromMessage(this);
  SignedTransactionProof copyWith(void Function(SignedTransactionProof) updates) => super.copyWith((message) => updates(message as SignedTransactionProof));
  $pb.BuilderInfo get info_ => _i;
  static SignedTransactionProof create() => SignedTransactionProof();
  SignedTransactionProof createEmptyInstance() => create();
  static $pb.PbList<SignedTransactionProof> createRepeated() => $pb.PbList<SignedTransactionProof>();
  static SignedTransactionProof getDefault() => _defaultInstance ??= create()..freeze();
  static SignedTransactionProof _defaultInstance;

  AccumulatorProof get ledgerInfoToTransactionInfoProof => $_getN(0);
  set ledgerInfoToTransactionInfoProof(AccumulatorProof v) { setField(1, v); }
  $core.bool hasLedgerInfoToTransactionInfoProof() => $_has(0);
  void clearLedgerInfoToTransactionInfoProof() => clearField(1);

  $1.TransactionInfo get transactionInfo => $_getN(1);
  set transactionInfo($1.TransactionInfo v) { setField(2, v); }
  $core.bool hasTransactionInfo() => $_has(1);
  void clearTransactionInfo() => clearField(2);
}

class AccountStateProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountStateProof', package: const $pb.PackageName('types'))
    ..a<AccumulatorProof>(1, 'ledgerInfoToTransactionInfoProof', $pb.PbFieldType.OM, AccumulatorProof.getDefault, AccumulatorProof.create)
    ..a<$1.TransactionInfo>(2, 'transactionInfo', $pb.PbFieldType.OM, $1.TransactionInfo.getDefault, $1.TransactionInfo.create)
    ..a<SparseMerkleProof>(3, 'transactionInfoToAccountProof', $pb.PbFieldType.OM, SparseMerkleProof.getDefault, SparseMerkleProof.create)
    ..hasRequiredFields = false
  ;

  AccountStateProof() : super();
  AccountStateProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccountStateProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccountStateProof clone() => AccountStateProof()..mergeFromMessage(this);
  AccountStateProof copyWith(void Function(AccountStateProof) updates) => super.copyWith((message) => updates(message as AccountStateProof));
  $pb.BuilderInfo get info_ => _i;
  static AccountStateProof create() => AccountStateProof();
  AccountStateProof createEmptyInstance() => create();
  static $pb.PbList<AccountStateProof> createRepeated() => $pb.PbList<AccountStateProof>();
  static AccountStateProof getDefault() => _defaultInstance ??= create()..freeze();
  static AccountStateProof _defaultInstance;

  AccumulatorProof get ledgerInfoToTransactionInfoProof => $_getN(0);
  set ledgerInfoToTransactionInfoProof(AccumulatorProof v) { setField(1, v); }
  $core.bool hasLedgerInfoToTransactionInfoProof() => $_has(0);
  void clearLedgerInfoToTransactionInfoProof() => clearField(1);

  $1.TransactionInfo get transactionInfo => $_getN(1);
  set transactionInfo($1.TransactionInfo v) { setField(2, v); }
  $core.bool hasTransactionInfo() => $_has(1);
  void clearTransactionInfo() => clearField(2);

  SparseMerkleProof get transactionInfoToAccountProof => $_getN(2);
  set transactionInfoToAccountProof(SparseMerkleProof v) { setField(3, v); }
  $core.bool hasTransactionInfoToAccountProof() => $_has(2);
  void clearTransactionInfoToAccountProof() => clearField(3);
}

class EventProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EventProof', package: const $pb.PackageName('types'))
    ..a<AccumulatorProof>(1, 'ledgerInfoToTransactionInfoProof', $pb.PbFieldType.OM, AccumulatorProof.getDefault, AccumulatorProof.create)
    ..a<$1.TransactionInfo>(2, 'transactionInfo', $pb.PbFieldType.OM, $1.TransactionInfo.getDefault, $1.TransactionInfo.create)
    ..a<AccumulatorProof>(3, 'transactionInfoToEventProof', $pb.PbFieldType.OM, AccumulatorProof.getDefault, AccumulatorProof.create)
    ..hasRequiredFields = false
  ;

  EventProof() : super();
  EventProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  EventProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  EventProof clone() => EventProof()..mergeFromMessage(this);
  EventProof copyWith(void Function(EventProof) updates) => super.copyWith((message) => updates(message as EventProof));
  $pb.BuilderInfo get info_ => _i;
  static EventProof create() => EventProof();
  EventProof createEmptyInstance() => create();
  static $pb.PbList<EventProof> createRepeated() => $pb.PbList<EventProof>();
  static EventProof getDefault() => _defaultInstance ??= create()..freeze();
  static EventProof _defaultInstance;

  AccumulatorProof get ledgerInfoToTransactionInfoProof => $_getN(0);
  set ledgerInfoToTransactionInfoProof(AccumulatorProof v) { setField(1, v); }
  $core.bool hasLedgerInfoToTransactionInfoProof() => $_has(0);
  void clearLedgerInfoToTransactionInfoProof() => clearField(1);

  $1.TransactionInfo get transactionInfo => $_getN(1);
  set transactionInfo($1.TransactionInfo v) { setField(2, v); }
  $core.bool hasTransactionInfo() => $_has(1);
  void clearTransactionInfo() => clearField(2);

  AccumulatorProof get transactionInfoToEventProof => $_getN(2);
  set transactionInfoToEventProof(AccumulatorProof v) { setField(3, v); }
  $core.bool hasTransactionInfoToEventProof() => $_has(2);
  void clearTransactionInfoToEventProof() => clearField(3);
}

