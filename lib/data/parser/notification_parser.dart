import 'package:buddish_project/data/model/notification.dart';

class NotificationParser {
  static Notification fromJson(dynamic json) {
    return Notification(
      topic: json['data']['topic'],
    );
  }

  static Notification fromJsonOnResumeAndOnLaunch(dynamic json) {
    return Notification(
      topic: json['topic'],
    );
  }
}
