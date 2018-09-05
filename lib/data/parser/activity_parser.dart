import 'package:buddish_project/data/model/activity.dart';
import 'package:buddish_project/utils/string_util.dart';

class ActivityParser {
  static List<Activity> parseArray(List<dynamic> array) {
    return array.map((json) => parse(json)).toList();
  }

  static Activity parse(dynamic json) {
    return Activity(
      id: json[ActivityField.id],
      title: json[ActivityField.title],
      datetime: fromMysqlDateTime(json[ActivityField.datetime]),
      tags: json[ActivityField.tags] != null ? fromTagsString(json[ActivityField.tags]) : [],
      point: json[ActivityField.point],
    );
  }
}

abstract class ActivityField {
  static final String id = 'id';
  static final String title = 'title';
  static final String datetime = 'datetime';
  static final String tags = 'tags';
  static final String point = 'point';
}
