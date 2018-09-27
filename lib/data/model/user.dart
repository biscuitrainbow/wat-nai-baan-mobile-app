class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String tel;
  final DateTime dateOfBirth;
  final String gender;
  final String token;
  final bool isAdmin;

  User({
    this.id,
    this.email,
    this.name,
    this.gender,
    this.password,
    this.tel,
    this.dateOfBirth,
    this.token,
    this.isAdmin = false,
  });

  User copyWith({
    String id,
    String name,
    String tel,
    DateTime dateOfBirth,
    String gender,
    String token,
    bool isAdmin,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      tel: tel ?? this.tel,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      token: token ?? this.token,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  @override
  String toString() {
    return 'User{email: $email, name: $name, isAdmin: $isAdmin}';
  }
}
