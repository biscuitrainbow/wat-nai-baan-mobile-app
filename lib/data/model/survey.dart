import 'package:flutter/material.dart';

class Survey {
  static final double maxQuestion = 28.0;

  final int point;
  final String result;

  Survey({
    @required this.point,
    @required this.result,
  });
}

class SurveyField {
  static final String point = 'point';
  static final String result = 'result';
}
