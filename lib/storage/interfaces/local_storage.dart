abstract class LocalStorage {

  Future<String?> read();

  Future<bool> containsValue();

  Future<bool> write(String value);

  Future<bool> delete();
}