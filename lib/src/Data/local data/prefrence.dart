// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  // 1. API offline response
  static Future setAPIResponse(
      {required String responseBody, required String api}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(api, responseBody);
  }

  static Future<String> getAPIResponse({required String api}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(api) ?? "";
  }

  // Token
  static Future setToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token") ?? "";
  }

   static Future clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
