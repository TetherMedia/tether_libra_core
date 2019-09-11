// /**
//  * Ported from hkdf.js
//  *
//  * Copyright 2018 FutoIn Project (https://futoin.org)
//  * Copyright 2018 Andrey Galkin <andrey@futoin.org>
//
//    Dart Port:
//  * Copyright 2019 Gerry Lachac <glachac@tethermedia.com>
//  *
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */

import 'dart:typed_data';
import "package:typed_data/typed_buffers.dart";

import 'package:tether_libra_core/src/crypto/sha3FixDigest.dart';
import 'package:pointycastle/export.dart';

// int _hash_length(String hash) {
// switch ( hash ) {
//     case 'sha256': return 32;
//     case 'sha512': return 64;
//     case 'sha224': return 28;
//     case 'sha384': return 48;
//     // Not yet supported by Node.js crypto
//     // case 'blake2s256': return 32;
//     // case 'blake2b512': return 64;
//     case 'sha1': return 20;
//     case 'md5': return 16;
//     // Not yet supported by Node.js crypto
//     // case 'gost': return 32;
//     default:
//       throw Exception('Unsupported hash type: $hash');
//     }
// }

// /**
//  * HKDF extract action.
//  *
//  * @func
//  * @alias hkdf.extract
//  * @param {Buffer|string} ikm - Initial Keying Material
//  * @param {Buffer|string} salt - Optional salt (recommended)
//  * @returns {Buffer} A buffer with pseudorandom key
//  *
//  * @note Values are hardcoded with fallback for unknown algorithms.
//  */
Uint8List hkdf_extract(Uint8List ikm, Uint8List salt) {
  var length = 1088/8;

  var hmac = HMac(SHA3FixDigest(256), length.toInt())
          ..init(KeyParameter(salt));

  return hmac.process(ikm);

}

// /**
//  * HKDF expand action.
//  *
//  * @func
//  * @alias hkdf.expand
//  * @param {string} hash - Hash algorithm
//  * @param {integer} hash_len - Hash digest length
//  * @param {Buffer|string} prk - A buffer with pseudorandom key
//  * @param {Buffer|string} length - length of output keying material in octets
//  * @param {Buffer|string} info - Optional context (safe to skip)
//  * @returns {Buffer} A buffer with output keying material
//  *
//  * @note Values are hardcoded with fallback for unknown algorithms.
//  */
Uint8List hkdf_expand( Uint8List prk, Uint8List info,  int length ) {
    var b_info = info;
    var info_len = b_info.length;

    var hash_len = 1088/8;

    double stepsDouble = ( length / hash_len );
    int steps = stepsDouble.ceil();

    if ( steps > 0xFF ) {
        throw Exception('OKM length ${length} is too long for hash' );
    }

    // use single buffer with unnecessary create/copy/move operations
    var tSize =  hash_len * steps + info_len + 1;
    Uint8Buffer t = Uint8Buffer(tSize.toInt());

    for ( var c = 1, start = 0, end = 0; c <= steps; ++c ) {
        // add info (target, targetStart, sourceStart=0, sourceEnd=b_info.length)
        // b_info.copy( t, end );
        t.setRange(end, b_info.length, b_info);

        // add counter
        t[ end + info_len ] = c;

        var hmac = HMac(SHA3FixDigest(256), hash_len.toInt())
          ..init(KeyParameter(prk));

        var view = t.getRange(start,end + info_len + 1);
        var buffer = Uint8List.fromList(List.from(view));
        var tmp = hmac.process(buffer);
        t.setRange(end, tmp.length, tmp);

        // createHmac( hash, prk )
        //     // use view: T(C) = T(C-1) | info | C
        //     .update( t.slice( start, end + info_len + 1 ) )
        //     .digest()
        //     // put back to the same buffer
        //     .copy( t, end );

        start = end; // used for T(C-1) start
        end += hash_len.toInt(); // used for T(C-1) end & overall end
    }

    var output = Uint8List.fromList(List.from(t.getRange( 0, length )));

    return output;
}


