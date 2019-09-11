///
//  Generated code. Do not modify.
//  source: validator_set.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'validator_public_keys.pb.dart' as $13;

class ValidatorSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ValidatorSet', package: const $pb.PackageName('types'))
    ..pc<$13.ValidatorPublicKeys>(1, 'validatorPublicKeys', $pb.PbFieldType.PM,$13.ValidatorPublicKeys.create)
    ..hasRequiredFields = false
  ;

  ValidatorSet() : super();
  ValidatorSet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ValidatorSet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ValidatorSet clone() => ValidatorSet()..mergeFromMessage(this);
  ValidatorSet copyWith(void Function(ValidatorSet) updates) => super.copyWith((message) => updates(message as ValidatorSet));
  $pb.BuilderInfo get info_ => _i;
  static ValidatorSet create() => ValidatorSet();
  ValidatorSet createEmptyInstance() => create();
  static $pb.PbList<ValidatorSet> createRepeated() => $pb.PbList<ValidatorSet>();
  static ValidatorSet getDefault() => _defaultInstance ??= create()..freeze();
  static ValidatorSet _defaultInstance;

  $core.List<$13.ValidatorPublicKeys> get validatorPublicKeys => $_getList(0);
}

