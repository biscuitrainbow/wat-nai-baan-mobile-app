import 'dart:async';

import 'package:buddish_project/data/model/user.dart';

class Login {
  final String email;
  final String password;
  final Completer<Null> completer;

  Login(this.email, this.password, this.completer);
}

class LoginSuccess {
  final User user;

  LoginSuccess(this.user);
}

class FetchUserDetail {

}

class UpdateUser {
  final User user;
  final Completer<Null> completer;

  UpdateUser(this.user, this.completer);
}

class Logout {}

class Register {
  final User user;
  final Completer<Null> completer;

  Register(this.user, this.completer);
}
