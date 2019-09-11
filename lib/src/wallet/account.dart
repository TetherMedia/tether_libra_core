
import 'account_address.dart';
import 'key_factory.dart';

/// Wrapper for the keypair and the AccountAddress
class Account {
  final KeyPair keyPair;
  AccountAddress _address;

  Account(this.keyPair);

  AccountAddress get address {
    if (_address == null){
      _address = keyPair.get_address();
    }
    return _address;
  }

}