import 'dart:typed_data';

import 'package:tether_libra_core/src/wallet/mnemonic.dart';
import 'package:tether_libra_core/src/wallet/key_factory.dart';
import 'package:convert/convert.dart';
import 'package:tether_libra_core/src/crypto/sha3FixDigest.dart';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:test/test.dart';

import 'package:tweetnacl/tweetnacl.dart' as tweetnacl;

void main() {
  group('KeyFactory tests', () {

    setUp(() {
    });


    test('ed25519 validation', () {
      var privSeed = '74ecad56dee00175a5af59e1d2e92647b1aa2baa11a2bb049c0026838f097f34';
      var keypair = tweetnacl.Signature.keyPair_fromSeed(hex.decode(privSeed));
      var signature = tweetnacl.Signature(null, keypair.secretKey);

      var testBuffer = '16eece64eb0a0be3bfb01ba72d55a8dec0d589568deac71aefe94ee682a37b09';

      var message = Uint8List.fromList(hex.decode(testBuffer));

      var sig = signature.sign(message);

      Uint8List sigTrimmed = Uint8List.view(sig.buffer,0,64);

      expect('${hex.encode(sigTrimmed)}', 'a4b2a1a5b0416406d5324c54c6a60ef2fd539bb5f46f642a3bbb090fd3db771f9743e36182ec8b070dc93f3eb7df28ff17cdd2c305915dd2d16aaf22c7643e06');

    });

    test('SHA3 Hash algorithm variation same as Libra', () {

      var HashSaltValues = '46f174df6ca8de5ad29745f91584bb913e7df8dd162e3e921a5c1d8637c88d16';
      var bufferStr = '0a207030fb64701dc06f6922e65318f0d32d29c09b5a455256f116e95daa4497e2481adc010ab3014c49425241564d0a010007014a00000004000000034e000000060000000c54000000050000000d5900000004000000055d0000002900000004860000002000000007a60000000d00000000000001000200010300020002040203020402063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e64657200000000000000000000000000000000000000000000000000000000000000000001020004000c000c011101021224080112205fff494d224b88fd97bf27e5ef7d051c0b0495618eb94b92778c11de109e88b128c0843d300138c2bfc3e905';

      var hashBuffer = hex.decode(HashSaltValues);
      var buffer     = hex.decode(bufferStr);
      var hmac = SHA3FixDigest(256);
      hmac.update(hashBuffer, 0, hashBuffer.length);
      hmac.update(buffer, 0, buffer.length);
      var out = Uint8List(hmac.digestSize);
      hmac.doFinal(out, 0);

      expect('${hex.encode(out)}', '16eece64eb0a0be3bfb01ba72d55a8dec0d589568deac71aefe94ee682a37b09');


    });

    test('SHA3 256 test', () {
        var hmac = SHA3FixDigest(256);;
        var buffer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit...".codeUnits;

        var output = hmac.process(Uint8List.fromList(buffer));

        var expectString = '25f888a9cb41602e79e57584614e93d250c598348af94e2f7d3143293664bf6c';
        expect(hex.encode(output), expectString);

    });

      test('SHA3 256 HMAC  test', () {
        var key = Uint8List.fromList('secret'.codeUnits);
        var buffer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit...".codeUnits;

        var length = 1088/8;

        var hmac = HMac(SHA3FixDigest(256), length.toInt())
          ..init(KeyParameter(key));


        var output = hmac.process(Uint8List.fromList(buffer));

        var expectString = 'c95f132a88c087e2ab58957ae0b85699f41dff109a2c143c967d27f0624f54bc';
        expect(hex.encode(output), expectString);

    });

    test('Seed creation behaves like Rust code', () {
      var data = hex.decode("7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f");

      var mnemonic = Mnemonic.fromPhrase("legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will");

      var mnemonic2 = Mnemonic.mnemonic(data);

      expect(mnemonic.toString(), mnemonic2.toString());

      Seed seed = Seed(mnemonic, "LIBRA");

      var key_factory = KeyFactory.fromSeed(seed);
      expect("16274c9618ed59177ca948529c1884ba65c57984d562ec2b4e5aa1ee3e3903be",
          hex.encode(key_factory.master));

      // Check child_0 key derivation.
      var child_private_0 = key_factory.generateKey(ChildNumber(0));
      expect("358a375f36d74c30b7f3299b62d712b307725938f8cc931100fbd10a434fc8b9",
          hex.encode(child_private_0.private_key));

      // Check determinism, regenerate child_0.
      var child_private_0_again = key_factory.generateKey(ChildNumber(0));
       expect(hex.encode(child_private_0_again.private_key),
          hex.encode(child_private_0.private_key));

      // Check child_private_1 key derivation.
      var child_private_1 = key_factory.generateKey(ChildNumber(1));
      expect(hex.encode(child_private_1.private_key),
        "a325fe7d27b1b49f191cc03525951fec41b6ffa2d4b3007bb1d9dd353b7e56a6");

    });
  });
}
