///
//  Generated code. Do not modify.
//  source: libra_access.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'libra_access.pb.dart';
export 'libra_access.pb.dart';

class LibraAccessClient extends $grpc.Client {
  static final _$getBalance =
      $grpc.ClientMethod<BalanceRequest, BalanceResponse>(
          '/com.tethermedia.grpc.access.libra.LibraAccess/getBalance',
          (BalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => BalanceResponse.fromBuffer(value));
  static final _$transfer =
      $grpc.ClientMethod<TransferRequest, TransferResponse>(
          '/com.tethermedia.grpc.access.libra.LibraAccess/transfer',
          (TransferRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => TransferResponse.fromBuffer(value));

  LibraAccessClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<BalanceResponse> getBalance(BalanceRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBalance, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<TransferResponse> transfer(
      $async.Stream<TransferRequest> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$transfer, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class LibraAccessServiceBase extends $grpc.Service {
  $core.String get $name => 'com.tethermedia.grpc.access.libra.LibraAccess';

  LibraAccessServiceBase() {
    $addMethod($grpc.ServiceMethod<BalanceRequest, BalanceResponse>(
        'getBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => BalanceRequest.fromBuffer(value),
        (BalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<TransferRequest, TransferResponse>(
        'transfer',
        transfer,
        true,
        true,
        ($core.List<$core.int> value) => TransferRequest.fromBuffer(value),
        (TransferResponse value) => value.writeToBuffer()));
  }

  $async.Future<BalanceResponse> getBalance_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getBalance(call, await request);
  }

  $async.Future<BalanceResponse> getBalance(
      $grpc.ServiceCall call, BalanceRequest request);
  $async.Stream<TransferResponse> transfer(
      $grpc.ServiceCall call, $async.Stream<TransferRequest> request);
}
