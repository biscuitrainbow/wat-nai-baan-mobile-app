import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/data/parser/user_parser.dart';
import 'package:buddish_project/data/repository/constant.dart';
import 'package:buddish_project/utils/StringUtil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserRepository {
  static final String fieldId = 'id';
  static final String fieldEmail = 'email';
  static final String fieldPassword = 'password';
  static final String fieldName = 'name';
  static final String fieldTel = 'tel';
  static final String fieldDateOfBirth = 'date_of_birth';
  static final String fieldGender = 'gender';
  static final String fieldToken = 'token';

  Future<User> login(String email, String password) async {
    final response = await http.post('${Environment.apiUrl}/login', body: {
      fieldEmail: email,
      fieldPassword: password,
    });

    if (response.statusCode == 401) {
      throw (UnauthorizedException('เข้าสู่ระบบล้มเหลว อีเมลล์หรือรหัสผ่านไม่ถูกต้อง'));
    }

    final jsonResponse = json.decode(response.body);
    final user = UserParser.parse(jsonResponse);

    return user;
  }

  Future<User> register(User user) async {
    final response = await http.post('${Environment.apiUrl}/register', body: {
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

  Future<User> fetchUser(String token) async {
    final response = await http.get('${Environment.apiUrl}/user', headers: {
      HttpHeaders.AUTHORIZATION: toBearer(token),
    });

    final jsonResponse = json.decode(response.body);
    final user = UserParser.parse(jsonResponse);

    return user;
  }

  Future<Null> update(String token, User user) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd', 'th');

    final response = await http.put(
      '${Environment.apiUrl}/user',
      body: {
        fieldName: user.name,
        fieldDateOfBirth: formatter.format(user.dateOfBirth),
        fieldTel: user.tel,
        fieldGender: user.gender,
      },
      headers: {
        HttpHeaders.ACCEPT: AppString.httpApplicationJson,
        HttpHeaders.AUTHORIZATION: toBearer(token),
      },
    );
  }
}

class UnauthorizedException implements Exception {
  String error;

  UnauthorizedException(this.error);
}
