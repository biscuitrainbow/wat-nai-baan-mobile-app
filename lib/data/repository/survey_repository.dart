import 'dart:async';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/survey.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:dio/dio.dart';

class SurveyRepository {
  final Dio _dio;

  SurveyRepository(this._dio);

  Future<Null> createSurvey(String token, Survey survey) async {
    await _dio.post(
      '${Environment.apiUrl}/survey',
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: AppString.httpApplicationJson,
          HttpHeaders.authorizationHeader: toBearer(token),
        },
      ),
      data: {
        SurveyField.point: survey.point,
        SurveyField.result: survey.result,
      },
    );
  }
}
