///
//  Generated code. Do not modify.
//  source: validator_change.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ledger_info.pb.dart' as $6;
import 'events.pb.dart' as $3;

class ValidatorChangeEventWithProof extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ValidatorChangeEventWithProof', package: const $pb.PackageName('types'))
    ..a<$6.LedgerInfoWithSignatures>(1, 'ledgerInfoWithSigs', $pb.PbFieldType.OM, $6.LedgerInfoWithSignatures.getDefault, $6.LedgerInfoWithSignatures.create)
    ..a<$3.EventWithProof>(2, 'eventWithProof', $pb.PbFieldType.OM, $3.EventWithProof.getDefault, $3.EventWithProof.create)
    ..hasRequiredFields = false
  ;

  ValidatorChangeEventWithProof() : super();
  ValidatorChangeEventWithProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ValidatorChangeEventWithProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ValidatorChangeEventWithProof clone() => ValidatorChangeEventWithProof()..mergeFromMessage(this);
  ValidatorChangeEventWithProof copyWith(void Function(ValidatorChangeEventWithProof) updates) => super.copyWith((message) => updates(message as ValidatorChangeEventWithProof));
  $pb.BuilderInfo get info_ => _i;
  static ValidatorChangeEventWithProof create() => ValidatorChangeEventWithProof();
  ValidatorChangeEventWithProof createEmptyInstance() => create();
  static $pb.PbList<ValidatorChangeEventWithProof> createRepeated() => $pb.PbList<ValidatorChangeEventWithProof>();
  static ValidatorChangeEventWithProof getDefault() => _defaultInstance ??= create()..freeze();
  static ValidatorChangeEventWithProof _defaultInstance;

  $6.LedgerInfoWithSignatures get ledgerInfoWithSigs => $_getN(0);
  set ledgerInfoWithSigs($6.LedgerInfoWithSignatures v) { setField(1, v); }
  $core.bool hasLedgerInfoWithSigs() => $_has(0);
  void clearLedgerInfoWithSigs() => clearField(1);

  $3.EventWithProof get eventWithProof => $_getN(1);
  set eventWithProof($3.EventWithProof v) { setField(2, v); }
  $core.bool hasEventWithProof() => $_has(1);
  void clearEventWithProof() => clearField(2);
}

