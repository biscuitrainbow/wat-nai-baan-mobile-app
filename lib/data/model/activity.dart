import 'package:meta/meta.dart';

class Activity {
  final String title;
  final DateTime datetime;
  final List<String> tags;
  final int point;

  Activity({
    @required this.title,
    @required this.datetime,
    @required this.tags,
    @required this.point,
  });

  @override
  String toString() {
    return 'Activity{title: $title, datetime: $datetime, tags: $tags, point: $point}';
  }

  static List<String> tag = ['ทำบุญ', 'ปล่อยสัตว์', 'ช่วยเหลือสังคม', 'ทำสมาธิ'];
}
