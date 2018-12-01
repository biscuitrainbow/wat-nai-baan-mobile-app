import 'dart:async';

import 'package:buddish_project/data/model/survey.dart';

class CreateSurvey {
  final Survey survey;
  final Completer<Null> completer;

  CreateSurvey(this.survey, this.completer);
}
