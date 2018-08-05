import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/redux/user/user_action.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  new TypedReducer<User, LoginSuccess>(_loginSuccess),
]);

User _loginSuccess(
  User state,
  LoginSuccess action,
) {
  return action.user;
}
