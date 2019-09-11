///
//  Generated code. Do not modify.
//  source: get_with_proof.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'ledger_info.pb.dart' as $6;
import 'validator_change.pb.dart' as $7;
import 'account_state_blob.pb.dart' as $8;
import 'transaction.pb.dart' as $9;
import 'access_path.pb.dart' as $4;
import 'events.pb.dart' as $3;

class UpdateToLatestLedgerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateToLatestLedgerRequest', package: const $pb.PackageName('types'))
    ..a<Int64>(1, 'clientKnownVersion', $pb.PbFieldType.OU6, Int64.ZERO)
    ..pc<RequestItem>(2, 'requestedItems', $pb.PbFieldType.PM,RequestItem.create)
    ..hasRequiredFields = false
  ;

  UpdateToLatestLedgerRequest() : super();
  UpdateToLatestLedgerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UpdateToLatestLedgerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UpdateToLatestLedgerRequest clone() => UpdateToLatestLedgerRequest()..mergeFromMessage(this);
  UpdateToLatestLedgerRequest copyWith(void Function(UpdateToLatestLedgerRequest) updates) => super.copyWith((message) => updates(message as UpdateToLatestLedgerRequest));
  $pb.BuilderInfo get info_ => _i;
  static UpdateToLatestLedgerRequest create() => UpdateToLatestLedgerRequest();
  UpdateToLatestLedgerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateToLatestLedgerRequest> createRepeated() => $pb.PbList<UpdateToLatestLedgerRequest>();
  static UpdateToLatestLedgerRequest getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateToLatestLedgerRequest _defaultInstance;

  Int64 get clientKnownVersion => $_getI64(0);
  set clientKnownVersion(Int64 v) { $_setInt64(0, v); }
  $core.bool hasClientKnownVersion() => $_has(0);
  void clearClientKnownVersion() => clearField(1);

  $core.List<RequestItem> get requestedItems => $_getList(1);
}

enum RequestItem_RequestedItems {
  getAccountStateRequest, 
  getAccountTransactionBySequenceNumberRequest, 
  getEventsByEventAccessPathRequest, 
  getTransactionsRequest, 
  notSet
}

class RequestItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, RequestItem_RequestedItems> _RequestItem_RequestedItemsByTag = {
    1 : RequestItem_RequestedItems.getAccountStateRequest,
    2 : RequestItem_RequestedItems.getAccountTransactionBySequenceNumberRequest,
    3 : RequestItem_RequestedItems.getEventsByEventAccessPathRequest,
    4 : RequestItem_RequestedItems.getTransactionsRequest,
    0 : RequestItem_RequestedItems.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestItem', package: const $pb.PackageName('types'))
    ..a<GetAccountStateRequest>(1, 'getAccountStateRequest', $pb.PbFieldType.OM, GetAccountStateRequest.getDefault, GetAccountStateRequest.create)
    ..a<GetAccountTransactionBySequenceNumberRequest>(2, 'getAccountTransactionBySequenceNumberRequest', $pb.PbFieldType.OM, GetAccountTransactionBySequenceNumberRequest.getDefault, GetAccountTransactionBySequenceNumberRequest.create)
    ..a<GetEventsByEventAccessPathRequest>(3, 'getEventsByEventAccessPathRequest', $pb.PbFieldType.OM, GetEventsByEventAccessPathRequest.getDefault, GetEventsByEventAccessPathRequest.create)
    ..a<GetTransactionsRequest>(4, 'getTransactionsRequest', $pb.PbFieldType.OM, GetTransactionsRequest.getDefault, GetTransactionsRequest.create)
    ..oo(0, [1, 2, 3, 4])
    ..hasRequiredFields = false
  ;

  RequestItem() : super();
  RequestItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RequestItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RequestItem clone() => RequestItem()..mergeFromMessage(this);
  RequestItem copyWith(void Function(RequestItem) updates) => super.copyWith((message) => updates(message as RequestItem));
  $pb.BuilderInfo get info_ => _i;
  static RequestItem create() => RequestItem();
  RequestItem createEmptyInstance() => create();
  static $pb.PbList<RequestItem> createRepeated() => $pb.PbList<RequestItem>();
  static RequestItem getDefault() => _defaultInstance ??= create()..freeze();
  static RequestItem _defaultInstance;

  RequestItem_RequestedItems whichRequestedItems() => _RequestItem_RequestedItemsByTag[$_whichOneof(0)];
  void clearRequestedItems() => clearField($_whichOneof(0));

  GetAccountStateRequest get getAccountStateRequest => $_getN(0);
  set getAccountStateRequest(GetAccountStateRequest v) { setField(1, v); }
  $core.bool hasGetAccountStateRequest() => $_has(0);
  void clearGetAccountStateRequest() => clearField(1);

  GetAccountTransactionBySequenceNumberRequest get getAccountTransactionBySequenceNumberRequest => $_getN(1);
  set getAccountTransactionBySequenceNumberRequest(GetAccountTransactionBySequenceNumberRequest v) { setField(2, v); }
  $core.bool hasGetAccountTransactionBySequenceNumberRequest() => $_has(1);
  void clearGetAccountTransactionBySequenceNumberRequest() => clearField(2);

  GetEventsByEventAccessPathRequest get getEventsByEventAccessPathRequest => $_getN(2);
  set getEventsByEventAccessPathRequest(GetEventsByEventAccessPathRequest v) { setField(3, v); }
  $core.bool hasGetEventsByEventAccessPathRequest() => $_has(2);
  void clearGetEventsByEventAccessPathRequest() => clearField(3);

  GetTransactionsRequest get getTransactionsRequest => $_getN(3);
  set getTransactionsRequest(GetTransactionsRequest v) { setField(4, v); }
  $core.bool hasGetTransactionsRequest() => $_has(3);
  void clearGetTransactionsRequest() => clearField(4);
}

class UpdateToLatestLedgerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateToLatestLedgerResponse', package: const $pb.PackageName('types'))
    ..pc<ResponseItem>(1, 'responseItems', $pb.PbFieldType.PM,ResponseItem.create)
    ..a<$6.LedgerInfoWithSignatures>(2, 'ledgerInfoWithSigs', $pb.PbFieldType.OM, $6.LedgerInfoWithSignatures.getDefault, $6.LedgerInfoWithSignatures.create)
    ..pc<$7.ValidatorChangeEventWithProof>(3, 'validatorChangeEvents', $pb.PbFieldType.PM,$7.ValidatorChangeEventWithProof.create)
    ..hasRequiredFields = false
  ;

  UpdateToLatestLedgerResponse() : super();
  UpdateToLatestLedgerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UpdateToLatestLedgerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UpdateToLatestLedgerResponse clone() => UpdateToLatestLedgerResponse()..mergeFromMessage(this);
  UpdateToLatestLedgerResponse copyWith(void Function(UpdateToLatestLedgerResponse) updates) => super.copyWith((message) => updates(message as UpdateToLatestLedgerResponse));
  $pb.BuilderInfo get info_ => _i;
  static UpdateToLatestLedgerResponse create() => UpdateToLatestLedgerResponse();
  UpdateToLatestLedgerResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateToLatestLedgerResponse> createRepeated() => $pb.PbList<UpdateToLatestLedgerResponse>();
  static UpdateToLatestLedgerResponse getDefault() => _defaultInstance ??= create()..freeze();
  static UpdateToLatestLedgerResponse _defaultInstance;

  $core.List<ResponseItem> get responseItems => $_getList(0);

  $6.LedgerInfoWithSignatures get ledgerInfoWithSigs => $_getN(1);
  set ledgerInfoWithSigs($6.LedgerInfoWithSignatures v) { setField(2, v); }
  $core.bool hasLedgerInfoWithSigs() => $_has(1);
  void clearLedgerInfoWithSigs() => clearField(2);

  $core.List<$7.ValidatorChangeEventWithProof> get validatorChangeEvents => $_getList(2);
}

enum ResponseItem_ResponseItems {
  getAccountStateResponse, 
  getAccountTransactionBySequenceNumberResponse, 
  getEventsByEventAccessPathResponse, 
  getTransactionsResponse, 
  notSet
}

class ResponseItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ResponseItem_ResponseItems> _ResponseItem_ResponseItemsByTag = {
    3 : ResponseItem_ResponseItems.getAccountStateResponse,
    4 : ResponseItem_ResponseItems.getAccountTransactionBySequenceNumberResponse,
    5 : ResponseItem_ResponseItems.getEventsByEventAccessPathResponse,
    6 : ResponseItem_ResponseItems.getTransactionsResponse,
    0 : ResponseItem_ResponseItems.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResponseItem', package: const $pb.PackageName('types'))
    ..a<GetAccountStateResponse>(3, 'getAccountStateResponse', $pb.PbFieldType.OM, GetAccountStateResponse.getDefault, GetAccountStateResponse.create)
    ..a<GetAccountTransactionBySequenceNumberResponse>(4, 'getAccountTransactionBySequenceNumberResponse', $pb.PbFieldType.OM, GetAccountTransactionBySequenceNumberResponse.getDefault, GetAccountTransactionBySequenceNumberResponse.create)
    ..a<GetEventsByEventAccessPathResponse>(5, 'getEventsByEventAccessPathResponse', $pb.PbFieldType.OM, GetEventsByEventAccessPathResponse.getDefault, GetEventsByEventAccessPathResponse.create)
    ..a<GetTransactionsResponse>(6, 'getTransactionsResponse', $pb.PbFieldType.OM, GetTransactionsResponse.getDefault, GetTransactionsResponse.create)
    ..oo(0, [3, 4, 5, 6])
    ..hasRequiredFields = false
  ;

  ResponseItem() : super();
  ResponseItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ResponseItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ResponseItem clone() => ResponseItem()..mergeFromMessage(this);
  ResponseItem copyWith(void Function(ResponseItem) updates) => super.copyWith((message) => updates(message as ResponseItem));
  $pb.BuilderInfo get info_ => _i;
  static ResponseItem create() => ResponseItem();
  ResponseItem createEmptyInstance() => create();
  static $pb.PbList<ResponseItem> createRepeated() => $pb.PbList<ResponseItem>();
  static ResponseItem getDefault() => _defaultInstance ??= create()..freeze();
  static ResponseItem _defaultInstance;

  ResponseItem_ResponseItems whichResponseItems() => _ResponseItem_ResponseItemsByTag[$_whichOneof(0)];
  void clearResponseItems() => clearField($_whichOneof(0));

  GetAccountStateResponse get getAccountStateResponse => $_getN(0);
  set getAccountStateResponse(GetAccountStateResponse v) { setField(3, v); }
  $core.bool hasGetAccountStateResponse() => $_has(0);
  void clearGetAccountStateResponse() => clearField(3);

  GetAccountTransactionBySequenceNumberResponse get getAccountTransactionBySequenceNumberResponse => $_getN(1);
  set getAccountTransactionBySequenceNumberResponse(GetAccountTransactionBySequenceNumberResponse v) { setField(4, v); }
  $core.bool hasGetAccountTransactionBySequenceNumberResponse() => $_has(1);
  void clearGetAccountTransactionBySequenceNumberResponse() => clearField(4);

  GetEventsByEventAccessPathResponse get getEventsByEventAccessPathResponse => $_getN(2);
  set getEventsByEventAccessPathResponse(GetEventsByEventAccessPathResponse v) { setField(5, v); }
  $core.bool hasGetEventsByEventAccessPathResponse() => $_has(2);
  void clearGetEventsByEventAccessPathResponse() => clearField(5);

  GetTransactionsResponse get getTransactionsResponse => $_getN(3);
  set getTransactionsResponse(GetTransactionsResponse v) { setField(6, v); }
  $core.bool hasGetTransactionsResponse() => $_has(3);
  void clearGetTransactionsResponse() => clearField(6);
}

class GetAccountStateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountStateRequest', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetAccountStateRequest() : super();
  GetAccountStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetAccountStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetAccountStateRequest clone() => GetAccountStateRequest()..mergeFromMessage(this);
  GetAccountStateRequest copyWith(void Function(GetAccountStateRequest) updates) => super.copyWith((message) => updates(message as GetAccountStateRequest));
  $pb.BuilderInfo get info_ => _i;
  static GetAccountStateRequest create() => GetAccountStateRequest();
  GetAccountStateRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountStateRequest> createRepeated() => $pb.PbList<GetAccountStateRequest>();
  static GetAccountStateRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetAccountStateRequest _defaultInstance;

  $core.List<$core.int> get address => $_getN(0);
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);
}

class GetAccountStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountStateResponse', package: const $pb.PackageName('types'))
    ..a<$8.AccountStateWithProof>(1, 'accountStateWithProof', $pb.PbFieldType.OM, $8.AccountStateWithProof.getDefault, $8.AccountStateWithProof.create)
    ..hasRequiredFields = false
  ;

  GetAccountStateResponse() : super();
  GetAccountStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetAccountStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetAccountStateResponse clone() => GetAccountStateResponse()..mergeFromMessage(this);
  GetAccountStateResponse copyWith(void Function(GetAccountStateResponse) updates) => super.copyWith((message) => updates(message as GetAccountStateResponse));
  $pb.BuilderInfo get info_ => _i;
  static GetAccountStateResponse create() => GetAccountStateResponse();
  GetAccountStateResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountStateResponse> createRepeated() => $pb.PbList<GetAccountStateResponse>();
  static GetAccountStateResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetAccountStateResponse _defaultInstance;

  $8.AccountStateWithProof get accountStateWithProof => $_getN(0);
  set accountStateWithProof($8.AccountStateWithProof v) { setField(1, v); }
  $core.bool hasAccountStateWithProof() => $_has(0);
  void clearAccountStateWithProof() => clearField(1);
}

class GetAccountTransactionBySequenceNumberRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountTransactionBySequenceNumberRequest', package: const $pb.PackageName('types'))
    ..a<$core.List<$core.int>>(1, 'account', $pb.PbFieldType.OY)
    ..a<Int64>(2, 'sequenceNumber', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOB(3, 'fetchEvents')
    ..hasRequiredFields = false
  ;

  GetAccountTransactionBySequenceNumberRequest() : super();
  GetAccountTransactionBySequenceNumberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetAccountTransactionBySequenceNumberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetAccountTransactionBySequenceNumberRequest clone() => GetAccountTransactionBySequenceNumberRequest()..mergeFromMessage(this);
  GetAccountTransactionBySequenceNumberRequest copyWith(void Function(GetAccountTransactionBySequenceNumberRequest) updates) => super.copyWith((message) => updates(message as GetAccountTransactionBySequenceNumberRequest));
  $pb.BuilderInfo get info_ => _i;
  static GetAccountTransactionBySequenceNumberRequest create() => GetAccountTransactionBySequenceNumberRequest();
  GetAccountTransactionBySequenceNumberRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountTransactionBySequenceNumberRequest> createRepeated() => $pb.PbList<GetAccountTransactionBySequenceNumberRequest>();
  static GetAccountTransactionBySequenceNumberRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetAccountTransactionBySequenceNumberRequest _defaultInstance;

  $core.List<$core.int> get account => $_getN(0);
  set account($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasAccount() => $_has(0);
  void clearAccount() => clearField(1);

  Int64 get sequenceNumber => $_getI64(1);
  set sequenceNumber(Int64 v) { $_setInt64(1, v); }
  $core.bool hasSequenceNumber() => $_has(1);
  void clearSequenceNumber() => clearField(2);

  $core.bool get fetchEvents => $_get(2, false);
  set fetchEvents($core.bool v) { $_setBool(2, v); }
  $core.bool hasFetchEvents() => $_has(2);
  void clearFetchEvents() => clearField(3);
}

class GetAccountTransactionBySequenceNumberResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountTransactionBySequenceNumberResponse', package: const $pb.PackageName('types'))
    ..a<$9.SignedTransactionWithProof>(2, 'signedTransactionWithProof', $pb.PbFieldType.OM, $9.SignedTransactionWithProof.getDefault, $9.SignedTransactionWithProof.create)
    ..a<$8.AccountStateWithProof>(3, 'proofOfCurrentSequenceNumber', $pb.PbFieldType.OM, $8.AccountStateWithProof.getDefault, $8.AccountStateWithProof.create)
    ..hasRequiredFields = false
  ;

  GetAccountTransactionBySequenceNumberResponse() : super();
  GetAccountTransactionBySequenceNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetAccountTransactionBySequenceNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetAccountTransactionBySequenceNumberResponse clone() => GetAccountTransactionBySequenceNumberResponse()..mergeFromMessage(this);
  GetAccountTransactionBySequenceNumberResponse copyWith(void Function(GetAccountTransactionBySequenceNumberResponse) updates) => super.copyWith((message) => updates(message as GetAccountTransactionBySequenceNumberResponse));
  $pb.BuilderInfo get info_ => _i;
  static GetAccountTransactionBySequenceNumberResponse create() => GetAccountTransactionBySequenceNumberResponse();
  GetAccountTransactionBySequenceNumberResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountTransactionBySequenceNumberResponse> createRepeated() => $pb.PbList<GetAccountTransactionBySequenceNumberResponse>();
  static GetAccountTransactionBySequenceNumberResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetAccountTransactionBySequenceNumberResponse _defaultInstance;

  $9.SignedTransactionWithProof get signedTransactionWithProof => $_getN(0);
  set signedTransactionWithProof($9.SignedTransactionWithProof v) { setField(2, v); }
  $core.bool hasSignedTransactionWithProof() => $_has(0);
  void clearSignedTransactionWithProof() => clearField(2);

  $8.AccountStateWithProof get proofOfCurrentSequenceNumber => $_getN(1);
  set proofOfCurrentSequenceNumber($8.AccountStateWithProof v) { setField(3, v); }
  $core.bool hasProofOfCurrentSequenceNumber() => $_has(1);
  void clearProofOfCurrentSequenceNumber() => clearField(3);
}

class GetEventsByEventAccessPathRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsByEventAccessPathRequest', package: const $pb.PackageName('types'))
    ..a<$4.AccessPath>(1, 'accessPath', $pb.PbFieldType.OM, $4.AccessPath.getDefault, $4.AccessPath.create)
    ..a<Int64>(2, 'startEventSeqNum', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOB(3, 'ascending')
    ..a<Int64>(4, 'limit', $pb.PbFieldType.OU6, Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetEventsByEventAccessPathRequest() : super();
  GetEventsByEventAccessPathRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetEventsByEventAccessPathRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetEventsByEventAccessPathRequest clone() => GetEventsByEventAccessPathRequest()..mergeFromMessage(this);
  GetEventsByEventAccessPathRequest copyWith(void Function(GetEventsByEventAccessPathRequest) updates) => super.copyWith((message) => updates(message as GetEventsByEventAccessPathRequest));
  $pb.BuilderInfo get info_ => _i;
  static GetEventsByEventAccessPathRequest create() => GetEventsByEventAccessPathRequest();
  GetEventsByEventAccessPathRequest createEmptyInstance() => create();
  static $pb.PbList<GetEventsByEventAccessPathRequest> createRepeated() => $pb.PbList<GetEventsByEventAccessPathRequest>();
  static GetEventsByEventAccessPathRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetEventsByEventAccessPathRequest _defaultInstance;

  $4.AccessPath get accessPath => $_getN(0);
  set accessPath($4.AccessPath v) { setField(1, v); }
  $core.bool hasAccessPath() => $_has(0);
  void clearAccessPath() => clearField(1);

  Int64 get startEventSeqNum => $_getI64(1);
  set startEventSeqNum(Int64 v) { $_setInt64(1, v); }
  $core.bool hasStartEventSeqNum() => $_has(1);
  void clearStartEventSeqNum() => clearField(2);

  $core.bool get ascending => $_get(2, false);
  set ascending($core.bool v) { $_setBool(2, v); }
  $core.bool hasAscending() => $_has(2);
  void clearAscending() => clearField(3);

  Int64 get limit => $_getI64(3);
  set limit(Int64 v) { $_setInt64(3, v); }
  $core.bool hasLimit() => $_has(3);
  void clearLimit() => clearField(4);
}

class GetEventsByEventAccessPathResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsByEventAccessPathResponse', package: const $pb.PackageName('types'))
    ..pc<$3.EventWithProof>(1, 'eventsWithProof', $pb.PbFieldType.PM,$3.EventWithProof.create)
    ..a<$8.AccountStateWithProof>(2, 'proofOfLatestEvent', $pb.PbFieldType.OM, $8.AccountStateWithProof.getDefault, $8.AccountStateWithProof.create)
    ..hasRequiredFields = false
  ;

  GetEventsByEventAccessPathResponse() : super();
  GetEventsByEventAccessPathResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetEventsByEventAccessPathResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetEventsByEventAccessPathResponse clone() => GetEventsByEventAccessPathResponse()..mergeFromMessage(this);
  GetEventsByEventAccessPathResponse copyWith(void Function(GetEventsByEventAccessPathResponse) updates) => super.copyWith((message) => updates(message as GetEventsByEventAccessPathResponse));
  $pb.BuilderInfo get info_ => _i;
  static GetEventsByEventAccessPathResponse create() => GetEventsByEventAccessPathResponse();
  GetEventsByEventAccessPathResponse createEmptyInstance() => create();
  static $pb.PbList<GetEventsByEventAccessPathResponse> createRepeated() => $pb.PbList<GetEventsByEventAccessPathResponse>();
  static GetEventsByEventAccessPathResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetEventsByEventAccessPathResponse _defaultInstance;

  $core.List<$3.EventWithProof> get eventsWithProof => $_getList(0);

  $8.AccountStateWithProof get proofOfLatestEvent => $_getN(1);
  set proofOfLatestEvent($8.AccountStateWithProof v) { setField(2, v); }
  $core.bool hasProofOfLatestEvent() => $_has(1);
  void clearProofOfLatestEvent() => clearField(2);
}

class GetTransactionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionsRequest', package: const $pb.PackageName('types'))
    ..a<Int64>(1, 'startVersion', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(2, 'limit', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aOB(3, 'fetchEvents')
    ..hasRequiredFields = false
  ;

  GetTransactionsRequest() : super();
  GetTransactionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetTransactionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetTransactionsRequest clone() => GetTransactionsRequest()..mergeFromMessage(this);
  GetTransactionsRequest copyWith(void Function(GetTransactionsRequest) updates) => super.copyWith((message) => updates(message as GetTransactionsRequest));
  $pb.BuilderInfo get info_ => _i;
  static GetTransactionsRequest create() => GetTransactionsRequest();
  GetTransactionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionsRequest> createRepeated() => $pb.PbList<GetTransactionsRequest>();
  static GetTransactionsRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetTransactionsRequest _defaultInstance;

  Int64 get startVersion => $_getI64(0);
  set startVersion(Int64 v) { $_setInt64(0, v); }
  $core.bool hasStartVersion() => $_has(0);
  void clearStartVersion() => clearField(1);

  Int64 get limit => $_getI64(1);
  set limit(Int64 v) { $_setInt64(1, v); }
  $core.bool hasLimit() => $_has(1);
  void clearLimit() => clearField(2);

  $core.bool get fetchEvents => $_get(2, false);
  set fetchEvents($core.bool v) { $_setBool(2, v); }
  $core.bool hasFetchEvents() => $_has(2);
  void clearFetchEvents() => clearField(3);
}

class GetTransactionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionsResponse', package: const $pb.PackageName('types'))
    ..a<$9.TransactionListWithProof>(1, 'txnListWithProof', $pb.PbFieldType.OM, $9.TransactionListWithProof.getDefault, $9.TransactionListWithProof.create)
    ..hasRequiredFields = false
  ;

  GetTransactionsResponse() : super();
  GetTransactionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetTransactionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetTransactionsResponse clone() => GetTransactionsResponse()..mergeFromMessage(this);
  GetTransactionsResponse copyWith(void Function(GetTransactionsResponse) updates) => super.copyWith((message) => updates(message as GetTransactionsResponse));
  $pb.BuilderInfo get info_ => _i;
  static GetTransactionsResponse create() => GetTransactionsResponse();
  GetTransactionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTransactionsResponse> createRepeated() => $pb.PbList<GetTransactionsResponse>();
  static GetTransactionsResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetTransactionsResponse _defaultInstance;

  $9.TransactionListWithProof get txnListWithProof => $_getN(0);
  set txnListWithProof($9.TransactionListWithProof v) { setField(1, v); }
  $core.bool hasTxnListWithProof() => $_has(0);
  void clearTxnListWithProof() => clearField(1);
}

