import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/ui/news_list/news_list_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final FirebaseMessaging _firebaseMessaging;

  NotificationService(this._firebaseMessaging);

  void initPushNotification(BuildContext context, String topic) {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.subscribeToTopic(topic);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // try {
        //   Navigator.pushNamed(context, NewsListScreen.route);
        // } catch (e) {
        //   print(e);
        // }
      },
      onLaunch: (Map<String, dynamic> message) async {
        Navigator.of(context).pushNamed(NewsListScreen.route);
        //  _showNotification(message);
      },
      onResume: (Map<String, dynamic> message) async {
        Navigator.of(context).pushNamed(NewsListScreen.route);

        // _showNotification(message);
      },
    );
  }

  void unsubscribeTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<Null> sendNewsPushNotification(String title, String body) async {
    final payload = {
      'to': '/topics/${Environment.notificationTopic}',
      'priority': "high",
      'notification': {
        'body': body,
        'title': title,
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
