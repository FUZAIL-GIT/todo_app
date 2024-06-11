import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/core/constant/app_constant.dart';

class CacheManager {
  CacheManager._();
  static CacheManager? _instance;
  static CacheManager get instance {
    _instance ??= CacheManager._();
    return _instance!;
  }

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    webOptions: WebOptions(
      dbName: AppConstant.appName.toUpperCase(),
      publicKey: 'as09yda098fhdcv0s9dfys',
    ),
  );

  Future<void> saveData(String key, String value) async {
    if (await _secureStorage.containsKey(key: key)) {
      await _secureStorage.delete(key: key);
    }
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getData(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  Future<void> removeData(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }
}
