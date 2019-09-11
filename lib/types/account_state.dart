import 'dart:typed_data';

import 'package:convert/convert.dart';

import 'libra_coin.dart';

/// Parse a binary blob into the AccountState
class AccountState {


  final Uint8List  authenticationKey;
  final LibraCoin balance;
  final BigInt receivedEventsCount;
  final BigInt sentEventsCount;
  final BigInt sequenceNumber;
  final bool delegatedWithdrawalCapability;

  AccountState(
      this.authenticationKey,
      this.balance,
      this.receivedEventsCount,
      this.sentEventsCount,
      this.sequenceNumber,
      this.delegatedWithdrawalCapability
      );


  AccountState.empty(String address):
        this.balance = LibraCoin.fromInt(0),
        this.receivedEventsCount = BigInt.zero,
        this.sentEventsCount = BigInt.zero,
        this.sequenceNumber = BigInt.zero,
        this.delegatedWithdrawalCapability = true,
        this.authenticationKey = Uint8List.fromList(hex.decode(address));

  String toString() {
    return 'AccountState{balance: ${balance.toString()}, receivedEventsCount: $receivedEventsCount, sentEventsCount: $sentEventsCount, sequenceNumber: $sequenceNumber, delegatedWithdrawalCapability: $delegatedWithdrawalCapability ';
  }

  static AccountState fromBytes(Uint8List bytes) {
    // If we don't copy, the bytes.buffer points to the parent buffer, not bytes[0] like we expect
    var buffer = bytes.buffer;
    var bdata = bytes.buffer.asByteData();

    int cursor = 0;
    var authenticationKeyLen = bdata.getInt32(cursor, Endian.little);
    cursor += 4;

    // Copy bytes, not view
    var authenticationKey = Uint8List.fromList(buffer.asUint8List(cursor, authenticationKeyLen));
    cursor += authenticationKeyLen;

    var balance  = BigInt.from(bdata.getInt64(cursor, Endian.little));
    cursor +=8;

    bool delegatedWithdrawalCapability  = (bdata.getUint8(cursor)!=0);
    cursor +=1;

    var receivedEventsCount  = BigInt.from(bdata.getInt64(cursor, Endian.little));
    cursor +=8;
    var receivedEventsKeyLen = bdata.getInt32(cursor, Endian.little);
    cursor += 4;
    // TODO - Ignoring the events key for now
    // var receivedEventsKey  = Uint8List.fromList(buffer.asUint8List(cursor, receivedEventsKeyLen));
    cursor += receivedEventsKeyLen;


    var sentEventsCount  = BigInt.from(bdata.getInt64(cursor, Endian.little));
    cursor +=8;

    var sendEventsKeyLen = bdata.getInt32(cursor, Endian.little);
    cursor += 4;
   // var sendEventsKey  = Uint8List.fromList(buffer.asUint8List(cursor, sendEventsKeyLen));
    cursor += sendEventsKeyLen;


    var sequenceNumber  = BigInt.from(bdata.getInt64(cursor, Endian.little));

    return AccountState(authenticationKey, LibraCoin.fromNetwork(balance), receivedEventsCount,
        sentEventsCount, sequenceNumber, delegatedWithdrawalCapability);
  }

}

