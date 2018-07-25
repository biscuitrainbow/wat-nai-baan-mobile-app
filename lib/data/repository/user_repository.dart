import 'dart:async';
import 'dart:convert';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/parser/user_parser.dart';
import 'package:buddish_project/data/repository/constant.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static final String fieldId = 'id';
  static final String fieldEmail = 'email';
  static final String fieldPassword = 'password';
  static final String fieldName = 'name';
  static final String fieldTel = 'tel';
  static final String fieldDateOfBirth = 'date_of_birth';
  static final String fieldGender = 'gender';

  Future<User> login(String email, String password) async {
    final response = await http.post('${Environment.apiUrl}/login', body: {
      fieldEmail: email,
      fieldPassword: password,
    });

    final jsonResponse = json.decode(response.body);
    final user = UserParser.parse(jsonResponse[ApiConstant.fieldData]);

    return user;
  }

  Future<User> register(User user) async {
    final response = await http.post('${Environment.apiUrl}/login', body: {
      fieldEmail: user.email,
      fieldPassword: user.password,
      fieldName: user.name,
      fieldTel: user.tel,
      fieldDateOfBirth: user.dateOfBirth,
      fieldGender: user.gender,
    });

    final jsonResponse = json.decode(response.body);
    final registeredUser = UserParser.parse(jsonResponse[ApiConstant.fieldData]);

    return registeredUser;
  }

  Future<User> update(User user) async {
    final response = await http.put('${Environment.apiUrl}/user', body: {
      fieldEmail: user.email,
      fieldPassword: user.password,
      fieldName: user.name,
      fieldTel: user.tel,
      fieldDateOfBirth: user.dateOfBirth,
      fieldGender: user.gender,
    });

    final jsonResponse = json.decode(response.body);
    final updatedUser = UserParser.parse(jsonResponse[ApiConstant.fieldData]);

    return updatedUser;
  }
}
