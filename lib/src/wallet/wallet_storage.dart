
/// An interface to store and retrieve strings asynchronously
abstract class WalletLibraStorage {
  Future<String> setItem(String key, String value);
  Future<String> getItem(String key);
}

/// A sample wallet memory that stores data in memory hashtable
/// used during unit tests
class WalletLibraMemoryStorage extends WalletLibraStorage {
  Map<String, String> _data = {};

  /// store item in a map
  Future<String> setItem(String key, String value) async {
    _data[key] = value;
    return _data[key];
  }

  /// retrieve named item from map
  Future<String> getItem(String key) async {
    if (_data[key] != null) {
      return _data[key];
    }
    return null;
  }

}