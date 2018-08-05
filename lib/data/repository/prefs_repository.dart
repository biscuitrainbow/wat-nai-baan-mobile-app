import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static final String keyUserId = 'id';

  storeUser(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyUserId, id);
  }

  deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(keyUserId);
  }

  Future<String> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserId);
  }
}
