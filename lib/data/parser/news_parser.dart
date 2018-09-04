import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/utils/string_util.dart';

class NewsParser {
  static List<News> parseArray(List<dynamic> array) {
    return array.map((json) => parse(json)).toList();
  }

  static News parse(dynamic json) {
    return News(
      id: json[NewsField.id],
      title: json[NewsField.title],
      content: json[NewsField.content],
      cover: json[NewsField.cover],
      category: json[NewsField.category],
      dueDate: fromMysqlDateTime(json[NewsField.dueDate]),
      dateCreated: fromMysqlDateTime(json[NewsField.createdAt]),
      diff: json[NewsField.diff],
      location: json[NewsField.location],
    );
  }
}

abstract class NewsField {
  static final String id = 'id';
  static final String title = 'title';
  static final String content = 'content';
  static final String dueDate = 'due_date';
  static final String category = 'category';
  static final String cover = 'cover';
  static final String createdAt = 'created_at';
  static final String diff = 'diff';
  static final String location = 'location';
}
