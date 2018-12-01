import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/parser/notification_parser.dart';
import 'package:buddish_project/ui/common/confirm_dialog.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:buddish_project/ui/survey/survey_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final FirebaseMessaging _firebaseMessaging;

  NotificationService(this._firebaseMessaging);

  void _showScreen(String topic, BuildContext context) {
    try {
      if (topic == Environment.notificationTopicSurvey) {
        Navigator.of(context).pushNamed(SurveyScreen.route);
      } else if (topic == Environment.notificationTopicNews) {
        Navigator.of(context).pushNamed(NewsListScreen.route);
      }
    } catch (error) {
      print(error);
    }
  }

  void _showAskingForSurveyDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: 'แบบสอบถาม',
            description: 'กรุณาตอบแบบสอบถามสุขภาพเพื่อช่วยเราในการพัฒนาแอปพลิเคชันวัดในบ้านให้ดีขึ้น จากทีมงาน',
            confirmText: 'เริ่มทำ',
            cancelText: 'ไว้ทีหลัง',
            onCancel: () {
              Navigator.of(context).pop();
            },
            onConfirm: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(SurveyScreen.route);
            },
          );
        });
  }

  bool isComingFromFirebaseConsole(Map<String, dynamic> message) {
    return message['google.ttl'] != null;
  }

  void initPushNotification(BuildContext context, String topic) {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.subscribeToTopic(topic);
    _firebaseMessaging.subscribeToTopic('survey');
    _firebaseMessaging.subscribeToTopic('option');

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final notification = NotificationParser.fromJson(message);

        if (notification.topic == Environment.notificationTopicSurvey) {
          _showAskingForSurveyDialog(context);
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        final notification = NotificationParser.fromJsonOnResumeAndOnLaunch(message);

        _showScreen(notification.topic, context);
      },
      onResume: (Map<String, dynamic> message) async {
        final notification = NotificationParser.fromJsonOnResumeAndOnLaunch(message);

        _showScreen(notification.topic, context);
      },
    );
  }

  void unsubscribeTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<Null> sendNewsPushNotification(String title, String body) async {
    final payload = {
      'to': '/topics/${Environment.notificationTopicNews}',
      'priority': "high",
      'notification': {
        'body': body,
        'title': title,
        'topic': Environment.notificationTopicNews,
      },
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
      }
    };

    final jsonPayload = json.encode(payload);
    final response = await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: {
        HttpHeaders.contentTypeHeader: AppString.httpApplicationJson,
        HttpHeaders.authorizationHeader: 'key=AIzaSyCyDflg7CFyxLLnc67MLoOpw_3xWiKMiPg',
      },
      body: jsonPayload,
    );
  }
}
