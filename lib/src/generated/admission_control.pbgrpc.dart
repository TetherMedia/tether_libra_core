///
//  Generated code. Do not modify.
//  source: admission_control.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'admission_control.pb.dart';
import 'get_with_proof.pb.dart' as $0;
export 'admission_control.pb.dart';

class AdmissionControlClient extends $grpc.Client {
  static final _$submitTransaction =
      $grpc.ClientMethod<SubmitTransactionRequest, SubmitTransactionResponse>(
          '/admission_control.AdmissionControl/SubmitTransaction',
          (SubmitTransactionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              SubmitTransactionResponse.fromBuffer(value));
  static final _$updateToLatestLedger = $grpc.ClientMethod<
          $0.UpdateToLatestLedgerRequest, $0.UpdateToLatestLedgerResponse>(
      '/admission_control.AdmissionControl/UpdateToLatestLedger',
      ($0.UpdateToLatestLedgerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateToLatestLedgerResponse.fromBuffer(value));

  AdmissionControlClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<SubmitTransactionResponse> submitTransaction(
      SubmitTransactionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$submitTransaction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateToLatestLedgerResponse> updateToLatestLedger(
      $0.UpdateToLatestLedgerRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateToLatestLedger, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AdmissionControlServiceBase extends $grpc.Service {
  $core.String get $name => 'admission_control.AdmissionControl';

  AdmissionControlServiceBase() {
    $addMethod($grpc.ServiceMethod<SubmitTransactionRequest,
            SubmitTransactionResponse>(
        'SubmitTransaction',
        submitTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            SubmitTransactionRequest.fromBuffer(value),
        (SubmitTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateToLatestLedgerRequest,
            $0.UpdateToLatestLedgerResponse>(
        'UpdateToLatestLedger',
        updateToLatestLedger_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateToLatestLedgerRequest.fromBuffer(value),
        ($0.UpdateToLatestLedgerResponse value) => value.writeToBuffer()));
  }

  $async.Future<SubmitTransactionResponse> submitTransaction_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return submitTransaction(call, await request);
  }

  $async.Future<$0.UpdateToLatestLedgerResponse> updateToLatestLedger_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return updateToLatestLedger(call, await request);
  }

  $async.Future<SubmitTransactionResponse> submitTransaction(
      $grpc.ServiceCall call, SubmitTransactionRequest request);
  $async.Future<$0.UpdateToLatestLedgerResponse> updateToLatestLedger(
      $grpc.ServiceCall call, $0.UpdateToLatestLedgerRequest request);
}
