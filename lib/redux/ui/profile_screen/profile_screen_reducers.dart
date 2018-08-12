import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_action.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_state.dart';
import 'package:redux/redux.dart';

final profileScreenReducers = combineReducers<ProfileScreenState>([
  new TypedReducer<ProfileScreenState, ShowProfileLoading>(_showProfileLoading),
  new TypedReducer<ProfileScreenState, HideProfileLoading>(_successLoading),
]);

ProfileScreenState _showProfileLoading(
  ProfileScreenState state,
  ShowProfileLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

ProfileScreenState _successLoading(
  ProfileScreenState state,
  HideProfileLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
