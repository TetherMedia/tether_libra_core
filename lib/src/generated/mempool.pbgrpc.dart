///
//  Generated code. Do not modify.
//  source: mempool.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'mempool.pb.dart';
export 'mempool.pb.dart';

class MempoolClient extends $grpc.Client {
  static final _$addTransactionWithValidation = $grpc.ClientMethod<
          AddTransactionWithValidationRequest,
          AddTransactionWithValidationResponse>(
      '/mempool.Mempool/AddTransactionWithValidation',
      (AddTransactionWithValidationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          AddTransactionWithValidationResponse.fromBuffer(value));
  static final _$getBlock =
      $grpc.ClientMethod<GetBlockRequest, GetBlockResponse>(
          '/mempool.Mempool/GetBlock',
          (GetBlockRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => GetBlockResponse.fromBuffer(value));
  static final _$commitTransactions =
      $grpc.ClientMethod<CommitTransactionsRequest, CommitTransactionsResponse>(
          '/mempool.Mempool/CommitTransactions',
          (CommitTransactionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              CommitTransactionsResponse.fromBuffer(value));
  static final _$healthCheck =
      $grpc.ClientMethod<HealthCheckRequest, HealthCheckResponse>(
          '/mempool.Mempool/HealthCheck',
          (HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              HealthCheckResponse.fromBuffer(value));

  MempoolClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<AddTransactionWithValidationResponse>
      addTransactionWithValidation(AddTransactionWithValidationRequest request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$addTransactionWithValidation, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<GetBlockResponse> getBlock(GetBlockRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getBlock, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<CommitTransactionsResponse> commitTransactions(
      CommitTransactionsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$commitTransactions, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<HealthCheckResponse> healthCheck(
      HealthCheckRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$healthCheck, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class MempoolServiceBase extends $grpc.Service {
  $core.String get $name => 'mempool.Mempool';

  MempoolServiceBase() {
    $addMethod($grpc.ServiceMethod<AddTransactionWithValidationRequest,
            AddTransactionWithValidationResponse>(
        'AddTransactionWithValidation',
        addTransactionWithValidation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            AddTransactionWithValidationRequest.fromBuffer(value),
        (AddTransactionWithValidationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<GetBlockRequest, GetBlockResponse>(
        'GetBlock',
        getBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => GetBlockRequest.fromBuffer(value),
        (GetBlockResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<CommitTransactionsRequest,
            CommitTransactionsResponse>(
        'CommitTransactions',
        commitTransactions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            CommitTransactionsRequest.fromBuffer(value),
        (CommitTransactionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<HealthCheckRequest, HealthCheckResponse>(
        'HealthCheck',
        healthCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => HealthCheckRequest.fromBuffer(value),
        (HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<AddTransactionWithValidationResponse>
      addTransactionWithValidation_Pre(
          $grpc.ServiceCall call, $async.Future request) async {
    return addTransactionWithValidation(call, await request);
  }

  $async.Future<GetBlockResponse> getBlock_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getBlock(call, await request);
  }

  $async.Future<CommitTransactionsResponse> commitTransactions_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return commitTransactions(call, await request);
  }

  $async.Future<HealthCheckResponse> healthCheck_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return healthCheck(call, await request);
  }

  $async.Future<AddTransactionWithValidationResponse>
      addTransactionWithValidation(
          $grpc.ServiceCall call, AddTransactionWithValidationRequest request);
  $async.Future<GetBlockResponse> getBlock(
      $grpc.ServiceCall call, GetBlockRequest request);
  $async.Future<CommitTransactionsResponse> commitTransactions(
      $grpc.ServiceCall call, CommitTransactionsRequest request);
  $async.Future<HealthCheckResponse> healthCheck(
      $grpc.ServiceCall call, HealthCheckRequest request);
}
