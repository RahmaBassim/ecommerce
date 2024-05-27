

import 'package:e_commerce/shared/static/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  static SharedPreferences? sharedPreferences;

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String ) return await sharedPreferences?.setString(key, value);
    if (value is int ) return await sharedPreferences?.setInt(key, value);
    if (value is bool ) return await sharedPreferences?.setBool(key, value);

    return await sharedPreferences?.setDouble(key, value);
  }
  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }
  getToken(){
    return sharedPreferences?.getString(Constants.token);
  }
  removeToken(){}
}