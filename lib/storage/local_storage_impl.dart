import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasks_app_provider_consumer/storage/interfaces/local_storage.dart';

class LocalStorageImpl implements LocalStorage {

  final String _key;

  LocalStorageImpl({required String key})
    : _key = key;

  @override
  Future<bool> containsValue() async {
    
    const storage = FlutterSecureStorage();

    try {
      return await storage.containsKey(key: _key);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> delete() async {

    const storage = FlutterSecureStorage();

    try {

      // Mesmo se o valor não existir, eu ainda retorno true para o delete
      if(!(await containsValue())) {
        return true;
      }

      await storage.delete(key: _key);

      return true;

    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<String?> read() async {

    const storage = FlutterSecureStorage();

    try {
      return await storage.read(key: _key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<bool> write(String value) async {
    
    const storage = FlutterSecureStorage();

    try {

      await storage.write(key: _key, value: value);

      return await containsValue();
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}