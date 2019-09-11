import 'package:tether_libra_core/libra_wallet_client.dart';
import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/wallet_library.dart';
import 'package:tether_libra_core/src/wallet/wallet_storage.dart';
import 'package:test/test.dart';

void main() {
  const FROM_ADDRESS = "7030fb64701dc06f6922e65318f0d32d29c09b5a455256f116e95daa4497e248";
  const FROM_MNEMONIC = "cage blur unaware rule salute lemon aspect talk control pottery claw nothing poem brand club finish face pig post screen then reduce drive cake";

  group('LibraWallet tests', () {


    test('Wallet recover from mnemonic', () async {
      LibraWallet wallet = LibraWallet.fromMnemonic(Mnemonic.fromPhrase(FROM_MNEMONIC), seed: 'LIBRA');

      expect(wallet.mnemonic, isNotNull);
      expect(wallet.mnemonic.toString(), FROM_MNEMONIC);

      await wallet.generateAddresses(1);

      // Validate address is in wallet
      expect(wallet.getAccountFromAddress(FROM_ADDRESS), isNotNull);

    });

  test('Async wallet create', () async {
      LibraWallet wallet = await LibraWallet.createAsync();

      expect(wallet.mnemonic, isNotNull);

      print(wallet.mnemonic);
      WalletLibraMemoryStorage storage = WalletLibraMemoryStorage();

      await wallet.write_recovery(storage);

      LibraWallet rebuiltWallet = await LibraWallet.recover(storage);

      expect(rebuiltWallet.mnemonic.toString(), equals(wallet.mnemonic.toString()));

    });

    test('Wallet recover from storage, all Accounts rebuilt', () async {
      LibraWallet wallet = LibraWallet.create();

      expect(wallet.mnemonic, isNotNull);
      await wallet.newAccount();
      await wallet.newAccount();
      expect(wallet.addresses.length, equals(2));

      WalletLibraMemoryStorage storage = WalletLibraMemoryStorage();

      await wallet.write_recovery(storage);

      LibraWallet rebuiltWallet = await LibraWallet.recover(storage);

      expect(rebuiltWallet.mnemonic.toString(), equals(wallet.mnemonic.toString()));
      expect(rebuiltWallet.key_leaf.toString(), equals(rebuiltWallet.key_leaf.toString()));
      expect(rebuiltWallet.addresses.length, equals(wallet.addresses.length));

      // All addresses in original wallet exist in recovered wallet
      var addresses = wallet.addresses;
      addresses.forEach((addr){
        expect(rebuiltWallet.getAccountFromAddress(addr.toHex()),isNotNull);
      });

      // All accounts in recovered wallet have matching accont in origin
      rebuiltWallet.accounts.forEach((account){
        expect(wallet.getAccountFromAddress(account.address.toHex()),isNotNull);
      });


    });

  });
}
