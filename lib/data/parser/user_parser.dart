import 'dart:async';

import 'package:buddish_project/data/model/user.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UserParser {
  static User parse(dynamic json) {
    Future.wait([initializeDateFormatting('th', null)]);

    var formatter = DateFormat('yyyy-MM-dd', 'th');

    return User(
      id: json[UserField.id],
      email: json[UserField.email],
      name: json[UserField.name],
      tel: json[UserField.tel] ?? null,
      dateOfBirth: json[UserField.birthday] != null ? formatter.parse(json[UserField.birthday]) : null,
      gender: json[UserField.gender] ?? null,
      token: json[UserField.token] ?? null,
      isAdmin: json[UserField.isAdmin],
    );
  }
}

abstract class UserField {
  static final String id = 'id';
  static final String email = 'email';
  static final String password = 'password';
  static final String name = 'name';
  static final String tel = 'tel';
  static final String birthday = 'date_of_birth';
  static final String gender = 'gender';
  static final String token = 'token';
  static final String isAdmin = 'is_admin';
}
