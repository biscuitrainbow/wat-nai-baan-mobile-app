import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/activity_list_screen/activity_list_screen_action.dart';
import 'package:buddish_project/redux/ui/activity_list_screen/activity_list_screen_state.dart';
import 'package:redux/redux.dart';

final activityListReducers = combineReducers<ActivityListScreenState>([
  TypedReducer<ActivityListScreenState, ShowActivityListLoading>(_showNewsListLoading),
  TypedReducer<ActivityListScreenState, HideActivityListLoading>(_successNewsListLoading),
]);

ActivityListScreenState _showNewsListLoading(
  ActivityListScreenState state,
  ShowActivityListLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

ActivityListScreenState _successNewsListLoading(
  ActivityListScreenState state,
  HideActivityListLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
