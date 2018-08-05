import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_action.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:redux/redux.dart';

final loginScreenReducer = combineReducers<LoginScreenState>([
  new TypedReducer<LoginScreenState, ShowLoginLoading>(_showLoginLoading),
  new TypedReducer<LoginScreenState, HideLoginLoading>(_successLoading),
]);

LoginScreenState _showLoginLoading(
  LoginScreenState state,
  ShowLoginLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

LoginScreenState _successLoading(
  LoginScreenState state,
  HideLoginLoading action,
) {
  return state.copyWith(loadingStatus: LoadingStatus.success);
}
