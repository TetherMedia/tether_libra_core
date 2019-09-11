import 'dart:math';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:isolate/isolate.dart';
import 'package:tether_libra_core/src/io_utils.dart';
import 'package:tether_libra_core/src/wallet/account_address.dart';
import 'package:tether_libra_core/src/wallet/key_factory.dart';
import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/wallet_storage.dart';

import 'account.dart';

/// Logging package not working from isolates - quickfix for debugging
void log(String str) {
  DateFormat formatter = DateFormat('HH:mm:ss.S');
  String dateString = formatter.format(DateTime.now());
  print('$dateString: $str');

}

class LibraWallet {
  Mnemonic _mnemonic;
  KeyFactory _key_factory;
  Map<AccountAddress, ChildNumber> _addr_map;
  Map<String, Account> _accounts = Map<String, Account>();
  ChildNumber key_leaf;


  /// The Mnemonic that can be used to restore this wallet
  Mnemonic get mnemonic {
    return _mnemonic;
  }

  void _internal(Mnemonic mnemonic, {String seedString='LIBRA'}){
    _mnemonic = mnemonic;
    var seed = Seed(mnemonic, (seedString != null) ? seedString: 'LIBRA');
    _key_factory = KeyFactory.fromSeed(seed);
    _addr_map = Map<AccountAddress, ChildNumber>();
    key_leaf = ChildNumber(0);

  }

  ///
  /// Creates a new wallet.  This will create a new private/public keypair
  ///
  LibraWallet.create({String seed}) {
    final rng = Random.secure();
    final bytes = Uint8List(32);
    for (var i = 0; i < 32; i++) {
      bytes[i] = rng.nextInt(255);
    }

    _internal( Mnemonic.mnemonic(bytes), seedString: seed);
  }

  ///
  /// Restores/Opens a wallet using the saved mnemonic
  LibraWallet.fromMnemonic(Mnemonic mnemonic, {String seed}) {
    _internal(mnemonic, seedString:  seed);
  }


  static Future<LibraWallet> fromMnemonicAsync(Mnemonic mnemonic, {String seed}) async {
    IsolateRunner _isolateCreate = await IsolateRunner.spawn();
    return _isolateCreate.run(_fromMnemonic,
      {
        'mnemonic': mnemonic,
        'seed': seed
      }
    );
  }

  static Future<LibraWallet> createAsync( {String seed}) async {
    IsolateRunner _isolateCreate = await IsolateRunner.spawn();
    return _isolateCreate.run(_create,
      {
        'seed': seed
      }
    );
  }

  /// Function that writes the wallet Mnemonic to storage
  Future<void> write_recovery( WalletLibraStorage storage) async {
    return IoUtils.write_recovery(this, storage);
  }


  /// Recover wallet from storage
  static Future<LibraWallet> recover(WalletLibraStorage storage) async {
    return IoUtils.recover(storage);
  }

  /// Function that iterates from the current key_leaf until the supplied depth
  Future<void> generateAddresses(int depth) async {
    var current = key_leaf.child_number.toInt();
    if (current > depth) {
      throw Exception( "Addresses already generated up to the supplied depth");
    }
    var loops = ChildNumber(depth).toUnsigned64() - key_leaf.toUnsigned64();
    for (int i=0;i<loops;i++){
      await this.newAccount();
    }
  }


  /// Function that generates a new key and adds it to the addr_map and subsequently returns the
  /// AccountAddress associated to the PrivateKey, along with it's ChildNumber
  Future<Account> newAccount() async {
    KeyPair ep = await _key_factory.generateKeyInBackground(key_leaf);
    AccountAddress address = ep.get_address();
    ChildNumber child = key_leaf;

    key_leaf.increment();
    if (_accounts.containsKey(address.toHex())){
      throw Exception("This address is already in your wallet child: ${key_leaf}");
    }

    _addr_map[address] = child;
    var account = Account(ep);
    _accounts[address.toHex()] = account;
    return account;

  }

  /// Returns a list of all addresses controlled by this wallet that are currently held by the
  /// addr_map
  List<AccountAddress> get addresses {
    return List.from(_addr_map.keys);
  }

  /// Returns a list of all the accounts (the accounts addresses, and the keypair
  List<Account> get accounts {
    return List.from(_accounts.values);
  }

  /// If this address is owned by this wallet, return account.  this only works if
  /// the accout has been generated already and contained in the map
  Account getAccountFromAddress(String address) {
    return _accounts[address];
  }

}



// static isolate runners
LibraWallet _fromMnemonic(Map<String, dynamic> args){
  try {
    var x = LibraWallet.fromMnemonic(args['mnemonic'], seed: args['seed']);
    return x;
  }catch(e) {
    log('Exception');
    log(e);
    return null;
  }
}

LibraWallet _create(Map<String, dynamic> args){
  try {
    var x = LibraWallet.create(seed: args['seed']);
    return x;
  }catch(e) {
    log('Exception');
    log(e);
    return null;
  }
}