import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static final String keyUserId = 'token';

  saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyUserId, token);
  }

  deleteToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(keyUserId);
  }

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserId);
  }
}
