import 'package:flutter/material.dart';

class SubscribeTopic {
  final String topic;
  final BuildContext context;

  SubscribeTopic(this.topic, this.context);
}

class UnSubscribeTopic {
  final String topic;

  UnSubscribeTopic(this.topic);
}

class BroadcastTopic {
  final String title;
  final String body;
  final String topic;

  BroadcastTopic(this.title, this.body, this.topic);
}
