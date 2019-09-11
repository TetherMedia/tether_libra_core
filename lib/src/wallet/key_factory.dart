import 'dart:typed_data';

import 'package:isolate/isolate_runner.dart';
import 'package:tether_libra_core/src/crypto/hkdf.dart';
import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/account_address.dart';
import "package:pointycastle/export.dart";
import 'package:tether_libra_core/src/crypto/sha3FixDigest.dart';
import 'package:tweetnacl/tweetnacl.dart' as tweetnacl;

/// There is no uint64 in dart, the int is 2s-compliment.
/// represent it as a BigInt
class ChildNumber {
  BigInt child_number;

  ChildNumber(int value) {
    this.child_number = BigInt.from(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildNumber && child_number == other.child_number;

  /// Bump the ChildNumber
  increment() {
    child_number = child_number + BigInt.one;
  }

  // TODO validate this logic with big numbers
  int toUnsigned64() {
    return child_number.toUnsigned(64).toInt();
  }

  String toString() {
    return child_number.toString();
  }
}

/// Constructor for creating an ExtendedPrivKey from a ed25519 PrivateKey. Note that the
/// ChildNumber are not used in this iteration of LibraWallet, but in order to
/// enable more general Hierarchical KeyDerivation schemes, we include it for completeness.
class KeyPair {
  ChildNumber _child_number;
  Uint8List private_key;
  tweetnacl.KeyPair _keyPair;

  /// This calls a computationally expensive operation
  KeyPair(this._child_number, this.private_key) {
    // Tweet nacl's definition of private_key is different, it is the longer version
    // Libra's usage of "private_key" is the tweet_nacl seed
    _keyPair = tweetnacl.Signature.keyPair_fromSeed(private_key);
  }

  Uint8List get public_key {
    return _keyPair.publicKey;
  }


  /// Computes the sha3 hash of the PublicKey and attempts to construct a Libra AccountAddress
  /// from the raw bytes of the pubkey hash
  AccountAddress get_address() {

    // Pointycastle regular SHA3 is actually Keccak sha3
    // Libra Rust code implies this should be keccak, but it appears to behave as non-keccak sha3
    //    var keccak = new SHA3Digest(256);
    var keccak = SHA3FixDigest(256);
    var hash = keccak.process(public_key);

    var address = AccountAddress(hash);
    return address;
  }

  /// Libra specific sign function that is capable of signing an arbitrary HashValue
  /// NOTE: In Libra, we do not sign the raw bytes of a transaction, instead we sign the raw
  /// bytes of the sha3 hash of the raw bytes of a transaction. It is important to note that the
  /// raw bytes of the sha3 hash will be hashed again as part of the ed25519 signature algorithm.
  /// In other words: In Libra, the message used for signature and verification is the sha3 hash
  /// of the transaction. This sha3 hash is then hashed again using SHA512 to arrive at the
  /// deterministic nonce for the EdDSA.
  Uint8List sign( Uint8List message ) {

    var signature = tweetnacl.Signature(null, _keyPair.secretKey);
    var sig = signature.sign(message);
    Uint8List sigTrimmed = Uint8List.view(sig.buffer,0,64);
    return sigTrimmed;

  }
}

class KeyFactory {
  static final MNEMONIC_SALT_PREFIX = "LIBRA WALLET: mnemonic salt prefix\$".codeUnits;
  static final MASTER_KEY_SALT = "LIBRA WALLET: master key salt\$".codeUnits;
  static final INFO_PREFIX = "LIBRA WALLET: derived key\$".codeUnits;
  Uint8List master;

  KeyFactory.fromSeed(Seed seed) {
    var hkdf_extract_value = hkdf_extract(Uint8List.fromList(seed.data),
        Uint8List.fromList(KeyFactory.MASTER_KEY_SALT));

    master = hkdf_extract_value;


  }

///Signature: 265fd594ca4f8c5bb61cffdb6937d4358990153950321325f1c57824fcecee53076f0bd5ed7e899b2989dcb70027943f185e38c0a5fd95b3dae8866a9d0bd906
  KeyPair generateKey(ChildNumber child) {
    // application info in the HKDF context is defined as Libra derived key$child_number.
    List<int> le_n = List();

    var buffer = Uint64List(1).buffer;
    var bdata = ByteData.view(buffer);
    bdata.setUint64(0, child.toUnsigned64(), Endian.little);

    List<int> _info = List<int>.from(KeyFactory.INFO_PREFIX);
    _info.addAll(le_n);
    _info.addAll(buffer.asUint8List());

    Uint8List info = Uint8List.fromList(_info);

    var hkdf_expand_value = hkdf_expand(master, info, 32);
    var sk = hkdf_expand_value;

    return KeyPair(child, sk);
  }

  Future<KeyPair> generateKeyInBackground(ChildNumber child) async {
    IsolateRunner _isolate = await IsolateRunner.spawn();
    return _isolate.run(_generateKeyPair, {
      'child': child,
      'master': master
    });
  }
}

KeyPair _generateKeyPair(Map<String, dynamic> args){
    ChildNumber child = args['child'];
    Uint8List master = args['master'];

    // application info in the HKDF context is defined as Libra derived key$child_number.
    List<int> le_n = List();

    var buffer = Uint64List(1).buffer;
    var bdata = ByteData.view(buffer);
    bdata.setUint64(0, child.toUnsigned64(), Endian.little);

    List<int> _info = List<int>.from(KeyFactory.INFO_PREFIX);
    _info.addAll(le_n);
    _info.addAll(buffer.asUint8List());

    Uint8List info = Uint8List.fromList(_info);

    var hkdf_expand_value = hkdf_expand(master, info, 32);
    var sk = hkdf_expand_value;

    return KeyPair(child, sk);
}

class Seed {
  Uint8List data;

  /// This calls a computationally expensive operation
  Seed(Mnemonic mnemonic, String salt) {

    List<int> msalt = List<int>.from(KeyFactory.MNEMONIC_SALT_PREFIX);
    msalt.addAll(salt.codeUnits);
    Uint8List _msalt = Uint8List.fromList(msalt);

    var hashSize = 1088 / 8;

    var _derivator = PBKDF2KeyDerivator(
        HMac(SHA3FixDigest(256), hashSize.toInt()))
      ..init(Pbkdf2Parameters(_msalt, 2048, 32));

    var buffer = mnemonic.toString().codeUnits;
    this.data = _derivator.process(Uint8List.fromList(buffer));
  }
}
