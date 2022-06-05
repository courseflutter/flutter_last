import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    sharedPreferences?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences?.getBool(key);
  }
}
