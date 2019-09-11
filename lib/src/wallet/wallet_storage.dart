
abstract class WalletLibraStorage {
  Future<String> setItem(String key, String value);
  Future<String> getItem(String key);
}

/// A sample wallet memory that stores data in memory
/// used during unit tests
class WalletLibraMemoryStorage extends WalletLibraStorage {
  Map<String, String> _data = {};

  Future<String> setItem(String key, String value) async {
    _data[key] = value;
    return _data[key];
  }

  Future<String> getItem(String key) async {
    if (_data[key] != null) {
      return _data[key];
    }
    return null;
  }

}