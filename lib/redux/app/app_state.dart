import 'package:buddish_project/data/model/User.dart';

class AppState {
  final User user;

  AppState({
    this.user,
  });

  factory AppState.initial() {
    return AppState(
      user: null,
    );
  }

  AppState copyWith({
    User user,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }
}
