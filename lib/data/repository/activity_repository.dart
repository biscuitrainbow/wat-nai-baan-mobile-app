import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/data/parser/activity_parser.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ActivityRepository {
  Future<Null> addActivity(String token, Activity activity) async {
    final response = await http.post(
      '${Environment.apiUrl}/activity',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
      body: {
        ActivityField.title: activity.title,
        ActivityField.datetime: toMysqlDateTime(activity.datetime),
        ActivityField.point: activity.point.toString(),
        ActivityField.tags: activity.tags.isNotEmpty ? fromTagsList(activity.tags) : '',
      },
    );
  }

  Future<List<Activity>> fetchActivities(String token) async {
    final response = await http.get(
      '${Environment.apiUrl}/activity',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
    );

    print(response.body);

    final jsonResponse = json.decode(response.body);
    final activities = ActivityParser.parseArray(jsonResponse);

    return activities;
  }

  Future<Null> updateActivity(String token, Activity activity) async {
    final dio = new Dio();
    final response = await dio.put(
      '${Environment.apiUrl}/activity/${activity.id}',
      options: Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        headers: {
          HttpHeaders.acceptHeader: AppString.httpApplicationJson,
          HttpHeaders.authorizationHeader: toBearer(token),
        },
      ),
      data: {
        ActivityField.title: activity.title,
        ActivityField.datetime: toMysqlDateTime(activity.datetime),
        ActivityField.point: activity.point.toString(),
        ActivityField.tags: activity.tags.isNotEmpty ? fromTagsList(activity.tags) : '',
      },
    );
  }

  Future<Null> deleteActivity(String token, int activityId) async {
    final response = await http.delete(
      '${Environment.apiUrl}/activity/${activityId}',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
    );
  }
}
