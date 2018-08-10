import 'dart:async';

import 'package:buddish_project/data/model/User.dart';

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

class Logout {
}

class Register {
  final User user;

  Register(this.user);
}
