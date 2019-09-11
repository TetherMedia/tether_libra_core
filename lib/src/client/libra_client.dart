import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:http/http.dart' as http;

import 'package:grpc/grpc.dart';
import 'package:tether_libra_core/src/crypto/sha3FixDigest.dart';
import 'package:tether_libra_core/src/wallet/account_address.dart';
import 'package:tether_libra_core/src/wallet/account.dart';
import 'package:tether_libra_core/src/wallet/key_factory.dart';
import 'package:tether_libra_core/types/account_state.dart';
import 'package:tether_libra_core/types/libra_coin.dart';
import '../transaction/transaction.dart';
import '../transaction/hashSaltValues.dart';

import '../generated/admission_control.pbgrpc.dart';
import '../generated/get_with_proof.pb.dart';
import '../generated/transaction.pb.dart' as Transaction;
import 'decoder.dart';
import 'encoder.dart';

class LibraNetwork {
  static String Testnet = 'testnet';
}

class ServerHosts {
  static String DefaultFaucet =  'faucet.testnet.libra.org';
  static String DefaultTestnet =  'ac.testnet.libra.org';
}

class LibraLibConfig {
  int port;
  String host;
  String network;
  String faucetServerHost;
  String validatorSetFile;
}

class LibraClient {
  LibraLibConfig _config;
  AdmissionControlClient _client;
  ClientDecoder _decoder;
  ClientEncoder _encoder;

  LibraClient(LibraLibConfig config){
    _config = config;
    if (config.host == null){
      // since only testnet for now
      _config.host = ServerHosts.DefaultTestnet;
    }

    if (config.port == null) {
      _config.port = 80;
    }

    final ClientChannel channel = ClientChannel(
        _config.host,
        port: _config.port,
        options:
        ChannelOptions(credentials: const ChannelCredentials.insecure()));

    _client = AdmissionControlClient(channel);

    _decoder = ClientDecoder();
    _encoder = ClientEncoder();

  }


  /// Given an [AccountAddress] object, [Account] object, or the hex string representation of the address,
  /// query the block chain for the [AccountState]
  Future<AccountState> getAccountState(dynamic address) async  {
    final result = await this.getAccountStates([address]);
    return result[0];
  }


  ///
  /// Get the [AccountState] for a list of account addresses represented by hex string,
  /// [Account] or by an [AccountAddress]
  Future<List<AccountState>>  getAccountStates(List<dynamic>addresses) async {

    // final accountAddresses = addresses.map((address){return AccountAddress(address);});
    final accountAddresses = addresses.map((address){return _convertToAccountAddress(address);});

    final request = UpdateToLatestLedgerRequest();

    accountAddresses.forEach((address){
      final requestItem = RequestItem();
      final getAccountStateRequest = GetAccountStateRequest();
      getAccountStateRequest.address = address.address;
      requestItem.getAccountStateRequest = getAccountStateRequest;
      request.requestedItems.add(requestItem);
    });

    var response = await _client.updateToLatestLedger(request);

    List<AccountState> result = [];
    for (var i=0; i<response.responseItems.length;i++){
      var item = response.responseItems[i];
      final stateResponse = item.getAccountStateResponse;
      final stateWithProof = stateResponse.accountStateWithProof;
      if (stateWithProof.hasBlob()) {
        final stateBlob = stateWithProof.blob;
        final blob = Uint8List.fromList(stateBlob.blob);
        result.add(this._decoder.decodeAccountStateBlob(blob));
      }else{
        result.add(AccountState.empty(accountAddresses.elementAt(i).toHex()));
      }
    }
    return result;
  }


  ///
  /// Returns the specified account's transaction details of the specified [sequenceNumber]
  /// The address is an [Account], [AccountAddress] or the hex string of the account address
  ///
  Future<LibraSignedTransactionWithProof> getAccountTransaction(
      dynamic address,
      int sequenceNumber,
      [bool fetchEvents = true]
      ) async {

    AccountAddress accountAddress = _convertToAccountAddress(address);
    var request =  UpdateToLatestLedgerRequest();

    var requestItem = RequestItem();
    var getTransactionRequest = GetAccountTransactionBySequenceNumberRequest();
    getTransactionRequest.account = accountAddress.address;;
    getTransactionRequest.sequenceNumber = Int64.parseInt(sequenceNumber.toString());
    getTransactionRequest.fetchEvents = fetchEvents;

    requestItem.getAccountTransactionBySequenceNumberRequest = getTransactionRequest;

    request.requestedItems.add(requestItem);

    var response = await this._client.updateToLatestLedger(request);
    var responseItems = response.responseItems;

    if (responseItems.isEmpty) {
      return null;
    }


    var r = responseItems[0].getAccountTransactionBySequenceNumberResponse;
    var signedTransactionWP = r.signedTransactionWithProof;

    return _decoder.decodeSignedTransactionWithProof(signedTransactionWP);
  }

  ///
  /// TEST NEWORK ONLY - this will use the test network mint server to add coins to the test account address
  /// specified by [reciever]
  Future<String> mintWithFaucetService(
      String receiver,
      int numCoins,
      [bool waitForConfirmation = true]
      ) async {

    String serverHost = (_config.faucetServerHost != null)? _config.faucetServerHost : ServerHosts.DefaultFaucet;
    LibraCoin coins = LibraCoin.fromInt(numCoins);

    AccountAddress accountAddress = _convertToAccountAddress(receiver);
    String address = accountAddress.toHex();

    var response = await http.post('http://${serverHost}?amount=${coins.microLibra.toInt()}&address=${address}');

    if (response.statusCode != 200) {
      throw Exception('`Failed to query faucet service. Code: ${response.statusCode}, Err: ${response.body}');
    }
    var sequenceNumber = response.body;

    if (waitForConfirmation) {
      await this.waitForConfirmation(AccountAddress.defaultAddress().toHex(), BigInt.parse(sequenceNumber));
    }

    return sequenceNumber;
  }


  /// Given an [accountAddress] as a hex string, and the [transactionSequenceNumber], wait until the
  /// account state show that the sequence number has been verified.
  Future<bool> waitForConfirmation( String accountAddress,  BigInt transactionSequenceNumber, [BigInt currentTransactionSequenceNumber] ) async {
    int maxIterations = 50;

    for (int i=0;i<maxIterations;i++){
      var state = await getAccountState(accountAddress);
      if (state.sequenceNumber.compareTo(transactionSequenceNumber) >= 0){
        return true;
      }
      await Future.delayed(Duration(seconds: 1));
    }
    // Timeout
    return false;
  }


  // Future<LibraSignedTransaction> _signTransaction(LibraTransaction transaction, KeyPair keyPair) async  {
  //   var rawTxn = await _encoder.encodeLibraTransaction(this, transaction, transaction.sendersAddress);
  //   var signature = this._signRawTransaction(rawTxn, keyPair);

  //   return LibraSignedTransaction(transaction, keyPair.public_key, signature);
  // }

  ///
  /// Transfer coins from sender to receipient.
  /// numCoins should be in libraCoins based unit.
  ///
  Future<LibraTransactionResponse> transferCoins(Account sender, String recipientAddress, LibraCoin numCoins) async  {
    return this.execute(LibraTransaction.createTransfer(recipientAddress, numCoins.microLibra), sender);
  }

  Future<LibraTransactionResponse> execute(LibraTransaction transaction, Account sender) async {
    var rawTransaction = await _encoder.encodeLibraTransaction(this, transaction, sender.address);
    var signedTransaction = Transaction.SignedTransaction();

    var request = SubmitTransactionRequest();

    var senderSignature = _signRawTransaction(rawTransaction, sender.keyPair);
    signedTransaction.rawTxnBytes = rawTransaction.writeToBuffer();
    signedTransaction.senderPublicKey =  sender.keyPair.public_key;
    signedTransaction.senderSignature = senderSignature;

    request.signedTxn = signedTransaction;

    SubmitTransactionResponse response = await this._client.submitTransaction(request);

    var vmStatus = _decoder.decodeVMStatus(response.vmStatus);

    // Insert address/sequence into the transaction before we create LibraTransactionResponse.  Since we encoded the raw, the original
    // transaction does not have the address or sequence, and we use it in the awaitConfirmation()
    transaction.sendersAddress = sender.address;
    transaction.sequenceNumber = BigInt.parse(rawTransaction.sequenceNumber.toString());

    LibraTransactionResponse result = LibraTransactionResponse(
      LibraSignedTransaction(transaction, sender.keyPair.public_key, senderSignature),
      Uint8List.fromList(response.validatorId),
      response.acStatus == null ? null : LibraAdmissionControlStatus.values[response.acStatus.code.value],
      response.mempoolStatus == null ? null : LibraMempoolTransactionStatus.values[response.mempoolStatus.code.value],
      vmStatus,
    );

    return result;
  }

  Uint8List _signRawTransaction(Transaction.RawTransaction rawTransaction, KeyPair keyPair)  {

    var rawTxnBytes = rawTransaction.writeToBuffer();
    var hashSaltBytes = HashSaltValues.rawTransactionHashSaltAsBytes();


    var sha3 = SHA3FixDigest(256);

    sha3.update(hashSaltBytes, 0, hashSaltBytes.length);
    sha3.update(rawTxnBytes, 0, rawTxnBytes.length);

    var hash = Uint8List(sha3.digestSize);

    sha3.doFinal(hash, 0);

    return keyPair.sign(hash);
  }

  AccountAddress _convertToAccountAddress(dynamic value){
    if (value is String){
      return AccountAddress(value);
    }else if (value is Account) {
      return value.address;
    } else if (value is AccountAddress){
      return value;
    } else {
      throw Exception("Bad input type on address");
    }

  }

}
