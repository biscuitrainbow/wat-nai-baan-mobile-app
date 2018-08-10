class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String tel;
  final DateTime dateOfBirth;
  final String gender;
  final String token;

  User({
    this.id,
    this.email,
    this.name,
    this.gender,
    this.password,
    this.tel,
    this.dateOfBirth,
    this.token,
  });

  User copyWith({
    String id,
    String name,
    String tel,
    DateTime dateOfBirth,
    String gender,
    String token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      gender: gender ?? this.gender,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password, name: $name, tel: $tel, dateOfBirth: $dateOfBirth, gender: $gender, token: $token}';
  }
}
