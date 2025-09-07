import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _secureStroage = FlutterSecureStorage();

  Future<String?> readData(String key) async {
    return await _secureStroage.read(key: key);
  }

  Future<void> writeData(String key, String value) async {
    await _secureStroage.write(key: key, value: value);
  }

  Future<void> deleteData(String key) async {
    await _secureStroage.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await _secureStroage.deleteAll();
  }
}
