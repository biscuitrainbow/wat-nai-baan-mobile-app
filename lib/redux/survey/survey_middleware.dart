import 'package:buddish_project/data/repository/survey_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/survey/survey_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createSurveyMiddleware(
  SurveyRepository surveyRepository,
) {
  return [
    TypedMiddleware<AppState, CreateSurvey>(_createSurvey(surveyRepository)),
  ];
}

Middleware<AppState> _createSurvey(
  SurveyRepository surveyRepository,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is CreateSurvey) {
      try {
        final token = store.state.token;
        await surveyRepository.createSurvey(token, action.survey);
        action.completer.complete(null);
      } catch (error) {
        action.completer.completeError(error);
      }

      next(action);
    }
  };
}
