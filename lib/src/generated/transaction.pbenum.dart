///
//  Generated code. Do not modify.
//  source: transaction.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class WriteOpType extends $pb.ProtobufEnum {
  static const WriteOpType Write = WriteOpType._(0, 'Write');
  static const WriteOpType Delete = WriteOpType._(1, 'Delete');

  static const $core.List<WriteOpType> values = <WriteOpType> [
    Write,
    Delete,
  ];

  static final $core.Map<$core.int, WriteOpType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WriteOpType valueOf($core.int value) => _byValue[value];

  const WriteOpType._($core.int v, $core.String n) : super(v, n);
}

class TransactionArgument_ArgType extends $pb.ProtobufEnum {
  static const TransactionArgument_ArgType U64 = TransactionArgument_ArgType._(0, 'U64');
  static const TransactionArgument_ArgType ADDRESS = TransactionArgument_ArgType._(1, 'ADDRESS');
  static const TransactionArgument_ArgType STRING = TransactionArgument_ArgType._(2, 'STRING');
  static const TransactionArgument_ArgType BYTEARRAY = TransactionArgument_ArgType._(3, 'BYTEARRAY');

  static const $core.List<TransactionArgument_ArgType> values = <TransactionArgument_ArgType> [
    U64,
    ADDRESS,
    STRING,
    BYTEARRAY,
  ];

  static final $core.Map<$core.int, TransactionArgument_ArgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionArgument_ArgType valueOf($core.int value) => _byValue[value];

  const TransactionArgument_ArgType._($core.int v, $core.String n) : super(v, n);
}

