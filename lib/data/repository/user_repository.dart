import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/user.dart';
import 'package:buddish_project/data/parser/user_parser.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserRepository {
  Future<User> login(String email, String password) async {
    final response = await http.post('${Environment.apiUrl}/login', body: {
      UserField.email: email,
      UserField.password: password,
    });

    if (response.statusCode == 401) {
      throw (UnauthorizedException('เข้าสู่ระบบล้มเหลว อีเมลล์หรือรหัสผ่านไม่ถูกต้อง'));
    }

    final jsonResponse = json.decode(response.body);
    final user = UserParser.parse(jsonResponse);

    return user;
  }

  Future<User> register(User user) async {
    final body = {
      UserField.email: user.email,
      UserField.password: user.password,
      UserField.name: user.name,
      UserField.gender: user.gender,
    };

    final dio = new Dio();
    final response = await dio.post(
      '${Environment.apiUrl}/register',
      options: Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        headers: {
          HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        },
      ),
      data: body,
    );

    final registeredUser = UserParser.parse(response.data);
    return registeredUser;
  }

  Future<User> fetchUser(String token) async {
    final response = await http.get('${Environment.apiUrl}/user', headers: {
      HttpHeaders.authorizationHeader: toBearer(token),
    });

    final jsonResponse = json.decode(response.body);
    final user = UserParser.parse(jsonResponse);

    return user;
  }

  Future<Null> update(String token, User user) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd', 'th');

    final dio = new Dio();
    final response = await dio.put(
      '${Environment.apiUrl}/user',
      options: Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        headers: {
          HttpHeaders.acceptHeader: AppString.httpApplicationJson,
          HttpHeaders.authorizationHeader: toBearer(token),
        },
      ),
      data: {
        UserField.name: user.name,
        UserField.birthday: user.dateOfBirth != null ? formatter.format(user.dateOfBirth) : '',
        UserField.tel: user.tel ?? '',
        UserField.gender: user.gender,
      },
    );
  }
}

class UnauthorizedException implements Exception {
  String error;

  UnauthorizedException(this.error);
}
