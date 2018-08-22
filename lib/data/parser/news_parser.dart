import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/utils/string_util.dart';

class NewsParser {
  static List<News> parseArray(List<dynamic> array) {
    return array.map((json) => parse(json)).toList();
  }

  static News parse(dynamic json) {
    return News(
      title: json[Field.title],
      content: json[Field.content],
      cover: json[Field.cover],
      category: json[Field.category],
      dueDate: fromMysqlDateTime(json[Field.dueDate]),
      dateCreated: fromMysqlDateTime(json[Field.createdAt]),
      diff: json[Field.diff],
    );
  }
}
