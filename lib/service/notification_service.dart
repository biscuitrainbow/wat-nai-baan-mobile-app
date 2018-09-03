import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final FirebaseMessaging _firebaseMessaging;

  NotificationService(this._firebaseMessaging);

  void initPushNotification() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.subscribeToTopic('news');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  Future<Null> sendNewsPushNotification(String title, String body) async {
    final payload = {
      'to': '/topics/news',
      'priority': "high",
      'notification': {
        'body': body,
        'title': title,
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

    print(jsonPayload);
    print(response.request.headers);
  }
}
