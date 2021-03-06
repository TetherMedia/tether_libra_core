///
//  Generated code. Do not modify.
//  source: transaction.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'proof.pb.dart' as $2;
import 'events.pb.dart' as $3;
import 'access_path.pb.dart' as $4;
import 'transaction_info.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $5;

import 'transaction.pbenum.dart';

export 'transaction.pbenum.dart';

enum RawTransaction_Payload {
  program, 
  writeSet, 
  script, 
  module, 
  notSet
}

class RawTransaction extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, RawTransaction_Payload> _RawTransaction_PayloadByTag = {
    3 : RawTransaction_Payload.program,
    4 : RawTransaction_Payload.writeSet,
    8 : RawTransaction_Payload.script,
    9 : RawTransaction_Payload.module,
    0 : RawTransaction_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RawTransaction', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'senderAccount', $pb.PbFieldType.OY)
    ..a<Int64>(2, 'sequenceNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Program>(3, 'program', $pb.PbFieldType.OM, Program.getDefault, Program.create)
    ..a<WriteSet>(4, 'writeSet', $pb.PbFieldType.OM, WriteSet.getDefault, WriteSet.create)
    ..a<Int64>(5, 'maxGasAmount', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(6, 'gasUnitPrice', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(7, 'expirationTime', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Script>(8, 'script', $pb.PbFieldType.OM, Script.getDefault, Script.create)
    ..a<Module>(9, 'module', $pb.PbFieldType.OM, Module.getDefault, Module.create)
    ..oo(0, [3, 4, 8, 9])
    ..hasRequiredFields = false
  ;

  RawTransaction() : super();
  RawTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RawTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RawTransaction clone() => RawTransaction()..mergeFromMessage(this);
  RawTransaction copyWith(void Function(RawTransaction) updates) => super.copyWith((message) => updates(message as RawTransaction));
  $pb.BuilderInfo get info_ => _i;
  static RawTransaction create() => RawTransaction();
  RawTransaction createEmptyInstance() => create();
  static $pb.PbList<RawTransaction> createRepeated() => $pb.PbList<RawTransaction>();
  static RawTransaction getDefault() => _defaultInstance ??= create()..freeze();
  static RawTransaction _defaultInstance;

  RawTransaction_Payload whichPayload() => _RawTransaction_PayloadByTag[$_whichOneof(0)];
  void clearPayload() => clearField($_whichOneof(0));

  $core.List<$core.int> get senderAccount => $_getN(0);
  set senderAccount($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasSenderAccount() => $_has(0);
  void clearSenderAccount() => clearField(1);

  Int64 get sequenceNumber => $_getI64(1);
  set sequenceNumber(Int64 v) { $_setInt64(1, v); }
  $core.bool hasSequenceNumber() => $_has(1);
  void clearSequenceNumber() => clearField(2);

  Program get program => $_getN(2);
  set program(Program v) { setField(3, v); }
  $core.bool hasProgram() => $_has(2);
  void clearProgram() => clearField(3);

  WriteSet get writeSet => $_getN(3);
  set writeSet(WriteSet v) { setField(4, v); }
  $core.bool hasWriteSet() => $_has(3);
  void clearWriteSet() => clearField(4);

  Int64 get maxGasAmount => $_getI64(4);
  set maxGasAmount(Int64 v) { $_setInt64(4, v); }
  $core.bool hasMaxGasAmount() => $_has(4);
  void clearMaxGasAmount() => clearField(5);

  Int64 get gasUnitPrice => $_getI64(5);
  set gasUnitPrice(Int64 v) { $_setInt64(5, v); }
  $core.bool hasGasUnitPrice() => $_has(5);
  void clearGasUnitPrice() => clearField(6);

  Int64 get expirationTime => $_getI64(6);
  set expirationTime(Int64 v) { $_setInt64(6, v); }
  $core.bool hasExpirationTime() => $_has(6);
  void clearExpirationTime() => clearField(7);

  Script get script => $_getN(7);
  set script(Script v) { setField(8, v); }
  $core.bool hasScript() => $_has(7);
  void clearScript() => clearField(8);

  Module get module => $_getN(8);
  set module(Module v) { setField(9, v); }
  $core.bool hasModule() => $_has(8);
  void clearModule() => clearField(9);
}

class Program extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Program', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'code', $pb.PbFieldType.OY)
    ..pc<TransactionArgument>(2, 'arguments', $pb.PbFieldType.PM,TransactionArgument.create)
    ..p<$core.List<$core.int>>(3, 'modules', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  Program() : super();
  Program.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Program.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Program clone() => Program()..mergeFromMessage(this);
  Program copyWith(void Function(Program) updates) => super.copyWith((message) => updates(message as Program));
  $pb.BuilderInfo get info_ => _i;
  static Program create() => Program();
  Program createEmptyInstance() => create();
  static $pb.PbList<Program> createRepeated() => $pb.PbList<Program>();
  static Program getDefault() => _defaultInstance ??= create()..freeze();
  static Program _defaultInstance;

  $core.List<$core.int> get code => $_getN(0);
  set code($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasCode() => $_has(0);
  void clearCode() => clearField(1);

  $core.List<TransactionArgument> get arguments => $_getList(1);

  $core.List<$core.List<$core.int>> get modules => $_getList(2);
}

class Script extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Script', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'code', $pb.PbFieldType.OY)
    ..pc<TransactionArgument>(2, 'arguments', $pb.PbFieldType.PM,TransactionArgument.create)
    ..hasRequiredFields = false
  ;

  Script() : super();
  Script.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Script.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Script clone() => Script()..mergeFromMessage(this);
  Script copyWith(void Function(Script) updates) => super.copyWith((message) => updates(message as Script));
  $pb.BuilderInfo get info_ => _i;
  static Script create() => Script();
  Script createEmptyInstance() => create();
  static $pb.PbList<Script> createRepeated() => $pb.PbList<Script>();
  static Script getDefault() => _defaultInstance ??= create()..freeze();
  static Script _defaultInstance;

  $core.List<$core.int> get code => $_getN(0);
  set code($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasCode() => $_has(0);
  void clearCode() => clearField(1);

  $core.List<TransactionArgument> get arguments => $_getList(1);
}

class TransactionArgument extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionArgument', package: const $pb.PackageName('types'))
    ..e<TransactionArgument_ArgType>(1, 'type', $pb.PbFieldType.OE, TransactionArgument_ArgType.U64, TransactionArgument_ArgType.valueOf, TransactionArgument_ArgType.values)
    ..a<$core.List<$core.int>>(2, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  TransactionArgument() : super();
  TransactionArgument.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransactionArgument.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransactionArgument clone() => TransactionArgument()..mergeFromMessage(this);
  TransactionArgument copyWith(void Function(TransactionArgument) updates) => super.copyWith((message) => updates(message as TransactionArgument));
  $pb.BuilderInfo get info_ => _i;
  static TransactionArgument create() => TransactionArgument();
  TransactionArgument createEmptyInstance() => create();
  static $pb.PbList<TransactionArgument> createRepeated() => $pb.PbList<TransactionArgument>();
  static TransactionArgument getDefault() => _defaultInstance ??= create()..freeze();
  static TransactionArgument _defaultInstance;

  TransactionArgument_ArgType get type => $_getN(0);
  set type(TransactionArgument_ArgType v) { setField(1, v); }
  $core.bool hasType() => $_has(0);
  void clearType() => clearField(1);

  $core.List<$core.int> get data => $_getN(1);
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasData() => $_has(1);
  void clearData() => clearField(2);
}

class Module extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Module', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'code', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Module() : super();
  Module.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Module.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Module clone() => Module()..mergeFromMessage(this);
  Module copyWith(void Function(Module) updates) => super.copyWith((message) => updates(message as Module));
  $pb.BuilderInfo get info_ => _i;
  static Module create() => Module();
  Module createEmptyInstance() => create();
  static $pb.PbList<Module> createRepeated() => $pb.PbList<Module>();
  static Module getDefault() => _defaultInstance ??= create()..freeze();
  static Module _defaultInstance;

  $core.List<$core.int> get code => $_getN(0);
  set code($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasCode() => $_has(0);
  void clearCode() => clearField(1);
}

class SignedTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignedTransaction', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'rawTxnBytes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'senderPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'senderSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SignedTransaction() : super();
  SignedTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignedTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignedTransaction clone() => SignedTransaction()..mergeFromMessage(this);
  SignedTransaction copyWith(void Function(SignedTransaction) updates) => super.copyWith((message) => updates(message as SignedTransaction));
  $pb.BuilderInfo get info_ => _i;
  static SignedTransaction create() => SignedTransaction();
  SignedTransaction createEmptyInstance() => create();
  static $pb.PbList<SignedTransaction> createRepeated() => $pb.PbList<SignedTransaction>();
  static SignedTransaction getDefault() => _defaultInstance ??= create()..freeze();
  static SignedTransaction _defaultInstance;

  $core.List<$core.int> get rawTxnBytes => $_getN(0);
  set rawTxnBytes($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasRawTxnBytes() => $_has(0);
  void clearRawTxnBytes() => clearField(1);

  $core.List<$core.int> get senderPublicKey => $_getN(1);
  set senderPublicKey($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasSenderPublicKey() => $_has(1);
  void clearSenderPublicKey() => clearField(2);

  $core.List<$core.int> get senderSignature => $_getN(2);
  set senderSignature($core.List<$core.int> v) { $_setBytes(2, v); }
  $core.bool hasSenderSignature() => $_has(2);
  void clearSenderSignature() => clearField(3);
}

class SignedTransactionWithProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignedTransactionWithProof', package: const $pb.PackageName('types'))
    ..a<Int64>(1, 'version', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<SignedTransaction>(2, 'signedTransaction', $pb.PbFieldType.OM, SignedTransaction.getDefault, SignedTransaction.create)
    ..a<$2.SignedTransactionProof>(3, 'proof', $pb.PbFieldType.OM, $2.SignedTransactionProof.getDefault, $2.SignedTransactionProof.create)
    ..a<$3.EventsList>(4, 'events', $pb.PbFieldType.OM, $3.EventsList.getDefault, $3.EventsList.create)
    ..hasRequiredFields = false
  ;

  SignedTransactionWithProof() : super();
  SignedTransactionWithProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignedTransactionWithProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignedTransactionWithProof clone() => SignedTransactionWithProof()..mergeFromMessage(this);
  SignedTransactionWithProof copyWith(void Function(SignedTransactionWithProof) updates) => super.copyWith((message) => updates(message as SignedTransactionWithProof));
  $pb.BuilderInfo get info_ => _i;
  static SignedTransactionWithProof create() => SignedTransactionWithProof();
  SignedTransactionWithProof createEmptyInstance() => create();
  static $pb.PbList<SignedTransactionWithProof> createRepeated() => $pb.PbList<SignedTransactionWithProof>();
  static SignedTransactionWithProof getDefault() => _defaultInstance ??= create()..freeze();
  static SignedTransactionWithProof _defaultInstance;

  Int64 get version => $_getI64(0);
  set version(Int64 v) { $_setInt64(0, v); }
  $core.bool hasVersion() => $_has(0);
  void clearVersion() => clearField(1);

  SignedTransaction get signedTransaction => $_getN(1);
  set signedTransaction(SignedTransaction v) { setField(2, v); }
  $core.bool hasSignedTransaction() => $_has(1);
  void clearSignedTransaction() => clearField(2);

  $2.SignedTransactionProof get proof => $_getN(2);
  set proof($2.SignedTransactionProof v) { setField(3, v); }
  $core.bool hasProof() => $_has(2);
  void clearProof() => clearField(3);

  $3.EventsList get events => $_getN(3);
  set events($3.EventsList v) { setField(4, v); }
  $core.bool hasEvents() => $_has(3);
  void clearEvents() => clearField(4);
}

class SignedTransactionsBlock extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignedTransactionsBlock', package: const $pb.PackageName('types'))
    ..pc<SignedTransaction>(1, 'transactions', $pb.PbFieldType.PM,SignedTransaction.create)
    ..a<$core.List<$core.int>>(2, 'validatorPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'validatorSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SignedTransactionsBlock() : super();
  SignedTransactionsBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SignedTransactionsBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SignedTransactionsBlock clone() => SignedTransactionsBlock()..mergeFromMessage(this);
  SignedTransactionsBlock copyWith(void Function(SignedTransactionsBlock) updates) => super.copyWith((message) => updates(message as SignedTransactionsBlock));
  $pb.BuilderInfo get info_ => _i;
  static SignedTransactionsBlock create() => SignedTransactionsBlock();
  SignedTransactionsBlock createEmptyInstance() => create();
  static $pb.PbList<SignedTransactionsBlock> createRepeated() => $pb.PbList<SignedTransactionsBlock>();
  static SignedTransactionsBlock getDefault() => _defaultInstance ??= create()..freeze();
  static SignedTransactionsBlock _defaultInstance;

  $core.List<SignedTransaction> get transactions => $_getList(0);

  $core.List<$core.int> get validatorPublicKey => $_getN(1);
  set validatorPublicKey($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasValidatorPublicKey() => $_has(1);
  void clearValidatorPublicKey() => clearField(2);

  $core.List<$core.int> get validatorSignature => $_getN(2);
  set validatorSignature($core.List<$core.int> v) { $_setBytes(2, v); }
  $core.bool hasValidatorSignature() => $_has(2);
  void clearValidatorSignature() => clearField(3);
}

class WriteSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteSet', package: const $pb.PackageName('types'))
    ..pc<WriteOp>(1, 'writeSet', $pb.PbFieldType.PM,WriteOp.create)
    ..hasRequiredFields = false
  ;

  WriteSet() : super();
  WriteSet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteSet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteSet clone() => WriteSet()..mergeFromMessage(this);
  WriteSet copyWith(void Function(WriteSet) updates) => super.copyWith((message) => updates(message as WriteSet));
  $pb.BuilderInfo get info_ => _i;
  static WriteSet create() => WriteSet();
  WriteSet createEmptyInstance() => create();
  static $pb.PbList<WriteSet> createRepeated() => $pb.PbList<WriteSet>();
  static WriteSet getDefault() => _defaultInstance ??= create()..freeze();
  static WriteSet _defaultInstance;

  $core.List<WriteOp> get writeSet => $_getList(0);
}

class WriteOp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteOp', package: const $pb.PackageName('types'))
    ..a<$4.AccessPath>(1, 'accessPath', $pb.PbFieldType.OM, $4.AccessPath.getDefault, $4.AccessPath.create)
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..e<WriteOpType>(3, 'type', $pb.PbFieldType.OE, WriteOpType.Write, WriteOpType.valueOf, WriteOpType.values)
    ..hasRequiredFields = false
  ;

  WriteOp() : super();
  WriteOp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteOp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteOp clone() => WriteOp()..mergeFromMessage(this);
  WriteOp copyWith(void Function(WriteOp) updates) => super.copyWith((message) => updates(message as WriteOp));
  $pb.BuilderInfo get info_ => _i;
  static WriteOp create() => WriteOp();
  WriteOp createEmptyInstance() => create();
  static $pb.PbList<WriteOp> createRepeated() => $pb.PbList<WriteOp>();
  static WriteOp getDefault() => _defaultInstance ??= create()..freeze();
  static WriteOp _defaultInstance;

  $4.AccessPath get accessPath => $_getN(0);
  set accessPath($4.AccessPath v) { setField(1, v); }
  $core.bool hasAccessPath() => $_has(0);
  void clearAccessPath() => clearField(1);

  $core.List<$core.int> get value => $_getN(1);
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);

  WriteOpType get type => $_getN(2);
  set type(WriteOpType v) { setField(3, v); }
  $core.bool hasType() => $_has(2);
  void clearType() => clearField(3);
}

class AccountState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountState', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'blob', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AccountState() : super();
  AccountState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccountState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccountState clone() => AccountState()..mergeFromMessage(this);
  AccountState copyWith(void Function(AccountState) updates) => super.copyWith((message) => updates(message as AccountState));
  $pb.BuilderInfo get info_ => _i;
  static AccountState create() => AccountState();
  AccountState createEmptyInstance() => create();
  static $pb.PbList<AccountState> createRepeated() => $pb.PbList<AccountState>();
  static AccountState getDefault() => _defaultInstance ??= create()..freeze();
  static AccountState _defaultInstance;

  $core.List<$core.int> get address => $_getN(0);
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);

  $core.List<$core.int> get blob => $_getN(1);
  set blob($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasBlob() => $_has(1);
  void clearBlob() => clearField(2);
}

class TransactionToCommit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionToCommit', package: const $pb.PackageName('types'))
    ..a<SignedTransaction>(1, 'signedTxn', $pb.PbFieldType.OM, SignedTransaction.getDefault, SignedTransaction.create)
    ..pc<AccountState>(2, 'accountStates', $pb.PbFieldType.PM,AccountState.create)
    ..pc<$3.Event>(3, 'events', $pb.PbFieldType.PM,$3.Event.create)
    ..a<Int64>(4, 'gasUsed', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  TransactionToCommit() : super();
  TransactionToCommit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransactionToCommit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransactionToCommit clone() => TransactionToCommit()..mergeFromMessage(this);
  TransactionToCommit copyWith(void Function(TransactionToCommit) updates) => super.copyWith((message) => updates(message as TransactionToCommit));
  $pb.BuilderInfo get info_ => _i;
  static TransactionToCommit create() => TransactionToCommit();
  TransactionToCommit createEmptyInstance() => create();
  static $pb.PbList<TransactionToCommit> createRepeated() => $pb.PbList<TransactionToCommit>();
  static TransactionToCommit getDefault() => _defaultInstance ??= create()..freeze();
  static TransactionToCommit _defaultInstance;

  SignedTransaction get signedTxn => $_getN(0);
  set signedTxn(SignedTransaction v) { setField(1, v); }
  $core.bool hasSignedTxn() => $_has(0);
  void clearSignedTxn() => clearField(1);

  $core.List<AccountState> get accountStates => $_getList(1);

  $core.List<$3.Event> get events => $_getList(2);

  Int64 get gasUsed => $_getI64(3);
  set gasUsed(Int64 v) { $_setInt64(3, v); }
  $core.bool hasGasUsed() => $_has(3);
  void clearGasUsed() => clearField(4);
}

class TransactionListWithProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionListWithProof', package: const $pb.PackageName('types'))
    ..pc<SignedTransaction>(1, 'transactions', $pb.PbFieldType.PM,SignedTransaction.create)
    ..pc<$1.TransactionInfo>(2, 'infos', $pb.PbFieldType.PM,$1.TransactionInfo.create)
    ..a<$3.EventsForVersions>(3, 'eventsForVersions', $pb.PbFieldType.OM, $3.EventsForVersions.getDefault, $3.EventsForVersions.create)
    ..a<$5.UInt64Value>(4, 'firstTransactionVersion', $pb.PbFieldType.OM, $5.UInt64Value.getDefault, $5.UInt64Value.create)
    ..a<$2.AccumulatorProof>(5, 'proofOfFirstTransaction', $pb.PbFieldType.OM, $2.AccumulatorProof.getDefault, $2.AccumulatorProof.create)
    ..a<$2.AccumulatorProof>(6, 'proofOfLastTransaction', $pb.PbFieldType.OM, $2.AccumulatorProof.getDefault, $2.AccumulatorProof.create)
    ..hasRequiredFields = false
  ;

  TransactionListWithProof() : super();
  TransactionListWithProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TransactionListWithProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TransactionListWithProof clone() => TransactionListWithProof()..mergeFromMessage(this);
  TransactionListWithProof copyWith(void Function(TransactionListWithProof) updates) => super.copyWith((message) => updates(message as TransactionListWithProof));
  $pb.BuilderInfo get info_ => _i;
  static TransactionListWithProof create() => TransactionListWithProof();
  TransactionListWithProof createEmptyInstance() => create();
  static $pb.PbList<TransactionListWithProof> createRepeated() => $pb.PbList<TransactionListWithProof>();
  static TransactionListWithProof getDefault() => _defaultInstance ??= create()..freeze();
  static TransactionListWithProof _defaultInstance;

  $core.List<SignedTransaction> get transactions => $_getList(0);

  $core.List<$1.TransactionInfo> get infos => $_getList(1);

  $3.EventsForVersions get eventsForVersions => $_getN(2);
  set eventsForVersions($3.EventsForVersions v) { setField(3, v); }
  $core.bool hasEventsForVersions() => $_has(2);
  void clearEventsForVersions() => clearField(3);

  $5.UInt64Value get firstTransactionVersion => $_getN(3);
  set firstTransactionVersion($5.UInt64Value v) { setField(4, v); }
  $core.bool hasFirstTransactionVersion() => $_has(3);
  void clearFirstTransactionVersion() => clearField(4);

  $2.AccumulatorProof get proofOfFirstTransaction => $_getN(4);
  set proofOfFirstTransaction($2.AccumulatorProof v) { setField(5, v); }
  $core.bool hasProofOfFirstTransaction() => $_has(4);
  void clearProofOfFirstTransaction() => clearField(5);

  $2.AccumulatorProof get proofOfLastTransaction => $_getN(5);
  set proofOfLastTransaction($2.AccumulatorProof v) { setField(6, v); }
  $core.bool hasProofOfLastTransaction() => $_has(5);
  void clearProofOfLastTransaction() => clearField(6);
}

