
import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/wallet_library.dart';
import 'package:tether_libra_core/src/wallet/wallet_storage.dart';

class IoUtils {
  static const String DELIMITER = ";";
  static const String MNEMONIC = "MNEMONIC";
  static const String CHILD_DEPTH = "CHILD_DEPTH";

  static Future<LibraWallet> recover(WalletLibraStorage storage) async {

    String mnemonicStr = await storage.getItem(MNEMONIC);
    String depth = await storage.getItem(CHILD_DEPTH);
    if ((mnemonicStr == null) || (depth == null)){
      return null;
    }

    Mnemonic mnemonic = Mnemonic.fromPhrase(mnemonicStr);
    LibraWallet wallet = await LibraWallet.fromMnemonicAsync(mnemonic);
    int child = int.parse(depth.trim());
    await wallet.generateAddresses(child);
    return wallet;
  }

  static Future<void> write_recovery(LibraWallet wallet, WalletLibraStorage storage) async {
    await storage.setItem(MNEMONIC, wallet.mnemonic.toString());
    await storage.setItem(CHILD_DEPTH, '${wallet.key_leaf}');
  }

}