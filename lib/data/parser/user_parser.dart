import 'dart:async';

import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/data/repository/user_repository.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UserParser {
  static User parse(dynamic json) {
    Future.wait([initializeDateFormatting('th', null)]);

    var formatter = DateFormat('yyyy-MM-dd', 'th');

    return User(
      id: json[UserRepository.fieldId],
      email: json[UserRepository.fieldEmail],
      name: json[UserRepository.fieldName],
      tel: json[UserRepository.fieldTel] ?? null,
      dateOfBirth: formatter.parse(json[UserRepository.fieldDateOfBirth]) ?? null,
      gender: json[UserRepository.fieldGender] ?? null,
      token: json[UserRepository.fieldToken] ?? null,
    );
  }
}
