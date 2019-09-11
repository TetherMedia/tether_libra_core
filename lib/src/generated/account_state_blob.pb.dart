///
//  Generated code. Do not modify.
//  source: account_state_blob.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'proof.pb.dart' as $2;

class AccountStateBlob extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountStateBlob', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'blob', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AccountStateBlob() : super();
  AccountStateBlob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccountStateBlob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccountStateBlob clone() => AccountStateBlob()..mergeFromMessage(this);
  AccountStateBlob copyWith(void Function(AccountStateBlob) updates) => super.copyWith((message) => updates(message as AccountStateBlob));
  $pb.BuilderInfo get info_ => _i;
  static AccountStateBlob create() => AccountStateBlob();
  AccountStateBlob createEmptyInstance() => create();
  static $pb.PbList<AccountStateBlob> createRepeated() => $pb.PbList<AccountStateBlob>();
  static AccountStateBlob getDefault() => _defaultInstance ??= create()..freeze();
  static AccountStateBlob _defaultInstance;

  $core.List<$core.int> get blob => $_getN(0);
  set blob($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasBlob() => $_has(0);
  void clearBlob() => clearField(1);
}

class AccountStateWithProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountStateWithProof', package: const $pb.PackageName('types'))
    ..a<Int64>(1, 'version', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<AccountStateBlob>(2, 'blob', $pb.PbFieldType.OM, AccountStateBlob.getDefault, AccountStateBlob.create)
    ..a<$2.AccountStateProof>(3, 'proof', $pb.PbFieldType.OM, $2.AccountStateProof.getDefault, $2.AccountStateProof.create)
    ..hasRequiredFields = false
  ;

  AccountStateWithProof() : super();
  AccountStateWithProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AccountStateWithProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AccountStateWithProof clone() => AccountStateWithProof()..mergeFromMessage(this);
  AccountStateWithProof copyWith(void Function(AccountStateWithProof) updates) => super.copyWith((message) => updates(message as AccountStateWithProof));
  $pb.BuilderInfo get info_ => _i;
  static AccountStateWithProof create() => AccountStateWithProof();
  AccountStateWithProof createEmptyInstance() => create();
  static $pb.PbList<AccountStateWithProof> createRepeated() => $pb.PbList<AccountStateWithProof>();
  static AccountStateWithProof getDefault() => _defaultInstance ??= create()..freeze();
  static AccountStateWithProof _defaultInstance;

  Int64 get version => $_getI64(0);
  set version(Int64 v) { $_setInt64(0, v); }
  $core.bool hasVersion() => $_has(0);
  void clearVersion() => clearField(1);

  AccountStateBlob get blob => $_getN(1);
  set blob(AccountStateBlob v) { setField(2, v); }
  $core.bool hasBlob() => $_has(1);
  void clearBlob() => clearField(2);

  $2.AccountStateProof get proof => $_getN(2);
  set proof($2.AccountStateProof v) { setField(3, v); }
  $core.bool hasProof() => $_has(2);
  void clearProof() => clearField(3);
}

