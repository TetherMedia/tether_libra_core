
import 'package:tether_libra_core/libra_wallet_client.dart';
import 'package:tether_libra_core/src/client/libra_client.dart';
import 'package:tether_libra_core/src/transaction/transaction.dart';
import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/wallet_library.dart';
import 'package:tether_libra_core/types/libra_coin.dart';
import 'package:test/test.dart';

void main() {
  const FROM_MNEMONIC = "cage blur unaware rule salute lemon aspect talk control pottery claw nothing poem brand club finish face pig post screen then reduce drive cake";

  group('LibraClient tests', () {


    test('Wallet balance', () async {
      var client = LibraClient( LibraLibConfig()..network =  LibraNetwork.Testnet);

      // TEST ACCOUNT CREATION
      LibraWallet wallet = LibraWallet.create();
      Account account1 = await wallet.newAccount();

      var accountAddress = wallet.addresses[0].toHex();

      var account1State = await client.getAccountState(accountAddress);
      print('wallet balance: ${account1State.balance} sequence: ${account1State.sequenceNumber}');

      // Should have balance of 0
      expect(account1State.balance.toString(), equals("0.0"));
      expect(account1State.sequenceNumber.toInt(), equals(0));

      var accountState2 = await client.getAccountState(account1);
      expect(accountState2.balance.toString(), equals("0.0"));
      expect(accountState2.sequenceNumber.toInt(), equals(0));

      var accountState3 = await client.getAccountState(account1.address);
      expect(accountState3.balance.toString(), equals("0.0"));
      expect(accountState3.sequenceNumber.toInt(), equals(0));

    });

    test('Use minter address and sanity test calling getAccountTransaction()', () async {
      var client = LibraClient( LibraLibConfig()..network =  LibraNetwork.Testnet);

      final account1Address = AccountAddress.defaultAddress();

      // It should be safe to assume that the minter has done the 0 sequence
      final trans = await client.getAccountTransaction(account1Address, 0);
      expect(trans.signedTransaction.transaction.sendersAddress.toHex(), equals(account1Address.toHex()));

    });



    test('Query State and Transfer', () async {
      var client = LibraClient( LibraLibConfig()..network =  LibraNetwork.Testnet);
      var wallet = LibraWallet.fromMnemonic(Mnemonic.fromPhrase(FROM_MNEMONIC));

      // TEST ACCOUNT CREATION
      var account1 = await wallet.newAccount();
      var account1Address = account1.address.toHex();
      var account1State = await client.getAccountState(account1Address);

      var account2 = await wallet.newAccount();
      var account2Address = account2.address.toHex();
      var account2State = await client.getAccountState(account2Address);

      var amountToTransfer = 10;

      // TEST MINT Amount
      // print('Minting');

      await client.mintWithFaucetService(account1Address, amountToTransfer);
      await Future.delayed(Duration(seconds: 3));

      var newAccount1State = await client.getAccountState(account1Address);

      // ensure its balance is +xAmount
      expect(newAccount1State.balance.microLibra.toString(),equals((account1State.balance.microLibra + LibraCoin.fromInt(amountToTransfer).microLibra).toString()));

      // print('Mint complete');

      // TEST TRANSFER TRANSACTION OF yAmount
      account1State = await client.getAccountState(account1Address);
      var response = await client.transferCoins(account1, account2Address, LibraCoin.fromInt(amountToTransfer));
      expect(response.acStatus,equals(LibraAdmissionControlStatus.ACCEPTED));

      // ensure new account balance is +yAmount
      await response.awaitConfirmation(client);
      var newAccount2State = await client.getAccountState(account2Address);
      expect(newAccount2State.balance.microLibra.toString(),
          equals((account2State.balance.microLibra + LibraCoin.fromInt(amountToTransfer).microLibra).toString()));

    });


  });
}
