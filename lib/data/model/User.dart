import 'package:meta/meta.dart';

class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String tel;
  final DateTime dateOfBirth;
  final String gender;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.gender,
    this.password,
    this.tel,
    this.dateOfBirth,
  });

  User copyWith({
    String id,
    String name,
    String tel,
    DateTime dateOfBirth,
    String gender,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      gender: gender ?? this.gender,
    );
  }
}
