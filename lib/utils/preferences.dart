import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? prefs;

  static String deviceId = "deviceId";
}

class PreferencesHelper {
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    return p.setInt(key, value);
  }

  static Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }
}

class Prefs {
  static Future<bool> get getOpened =>
      PreferencesHelper.getBool(Const.isOpened);

  static Future<bool> setOpened(bool value) =>
      PreferencesHelper.setBool(Const.isOpened, value);

  static Future<String> get getDeviceId =>
      PreferencesHelper.getString(Const.deviceId);

  static Future setDeviceId(String value) =>
      PreferencesHelper.setString(Const.deviceId, value);
}

class Const {
  static const String isOpened = "ISOPENED";
  static const String deviceId = 'DEVICEID';
}
