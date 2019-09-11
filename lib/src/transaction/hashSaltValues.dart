import 'dart:typed_data';

import 'package:convert/convert.dart';

class HashSaltValues {
  static const String rawTransactionHashSalt = '46f174df6ca8de5ad29745f91584bb913e7df8dd162e3e921a5c1d8637c88d16';

  static Uint8List rawTransactionHashSaltAsBytes() {
    return Uint8List.fromList(hex.decode(rawTransactionHashSalt));
  }
}