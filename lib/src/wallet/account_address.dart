import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';

class AccountAddress {
  Uint8List address;
  static const int ADDRESS_LENGTH = 32;
  static const int SHORT_STRING_LENGTH = 4;
  static const String AssociationAddress = '000000000000000000000000000000000000000000000000000000000a550c18';

  /// Instantiate from  a string or a bytelist
  AccountAddress(dynamic address) {

    if (address is String){
      this.address = Uint8List.fromList(hex.decode(address));
    } else if (address is List){
      if (address.length != ADDRESS_LENGTH) {
        throw Exception('Address length does not equal $ADDRESS_LENGTH instead it is: ${address.length}');
      }
      this.address = address;
    } else {
      throw Exception("Bad input type on address");
    }

  }

  @override
  bool operator == (Object other) => other is AccountAddress && other.toHex() == toHex();

  @override
  int get hashCode => toHex().hashCode;

  AccountAddress.defaultAddress() {
    this.address = Uint8List.fromList(hex.decode(AssociationAddress));
  }

  bool isDefault() {
    return AccountAddress.defaultAddress().toHex() == this.toHex();
  }

  AccountAddress.random() {
    final rng = Random.secure();
    final bytes = Uint8List(ADDRESS_LENGTH);
    for (var i = 0; i < ADDRESS_LENGTH; i++) {
      bytes[i] = rng.nextInt(255);
    }
    this.address = bytes;
  }

  // Helpful in log messages
  String short_str() {
    return hex.encode(address.sublist(0, SHORT_STRING_LENGTH));
  }

  String toString() {
    return this.toHex();
  }

  String toHex() {
    return hex.encode(address.sublist(0, ADDRESS_LENGTH));
  }
}
