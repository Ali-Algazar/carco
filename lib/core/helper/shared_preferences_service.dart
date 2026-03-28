import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_prefs == null) await init();
    if (value is String) return await _prefs!.setString(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);
    if (value is double) return await _prefs!.setDouble(key, value);
    return false;
  }

  static dynamic getData({required String key}) async {
    if (_prefs == null) await init();
    return _prefs!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    if (_prefs == null) await init();
    return await _prefs!.remove(key);
  }

  static Future<bool> clearAll() async {
    if (_prefs == null) await init();
    return await _prefs!.clear();
  }
}
