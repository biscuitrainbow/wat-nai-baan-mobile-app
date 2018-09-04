import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/data/parser/news_parser.dart';
import 'package:buddish_project/utils/string_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<Null> addNews(String token, News news) async {
    final response = await http.post(
      '${Environment.apiUrl}/news',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
      body: {
        NewsField.title: news.title,
        NewsField.content: news.content,
        NewsField.dueDate: toMysqlDateTime(news.dueDate),
        NewsField.location: news.location,
        NewsField.category: news.category,
        NewsField.cover: news.cover,
      },
    );
  }

  Future<List<News>> fetchNews(String token) async {
    final response = await http.get(
      '${Environment.apiUrl}/news',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
    );

    final jsonResponse = json.decode(response.body);
    final news = NewsParser.parseArray(jsonResponse);

    return news;
  }

  Future<Null> update(String token, News news) async {
    final dio = new Dio();
    final response = await dio.put(
      '${Environment.apiUrl}/news/${news.id}',
      options: Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        headers: {
          HttpHeaders.acceptHeader: AppString.httpApplicationJson,
          HttpHeaders.authorizationHeader: toBearer(token),
        },
      ),
      data: {
        NewsField.title: news.title,
        NewsField.content: news.content,
        NewsField.dueDate: toMysqlDateTime(news.dueDate),
        NewsField.location: news.location,
        NewsField.category: news.category,
        NewsField.cover: news.cover,
      },
    );
  }

  Future<Null> delete(String token, int newsId) async {
    final response = await http.delete(
      '${Environment.apiUrl}/news/${newsId}',
      headers: {
        HttpHeaders.acceptHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: toBearer(token),
      },
    );
  }
}
