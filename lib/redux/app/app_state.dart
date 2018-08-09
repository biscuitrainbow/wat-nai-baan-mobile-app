import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';

class AppState {
  final User user;
  final String token;
  final List<Mantra> mantras;
  final LoginScreenState loginScreenState;
  final SermonVideoScreenState sermonVideoScreenState;

  AppState({
    this.user,
    this.token,
    this.mantras,
    this.loginScreenState,
    this.sermonVideoScreenState,
  });

  factory AppState.initial() {
    return AppState(
      user: null,
      token: null,
      mantras: Mantra.generate(),
      loginScreenState: LoginScreenState.initial(),
      sermonVideoScreenState: SermonVideoScreenState.initial(),
    );
  }

  AppState copyWith({
    User user,
    String token,
    List<Mantra> mantras,
    LoginScreenState loginScreenState,
    SermonVideoScreenState sermonVideoScreenState,
  }) {
    return AppState(
      user: user ?? this.user,
      token: token ?? this.token,
      mantras: mantras ?? this.mantras,
      loginScreenState: loginScreenState ?? this.loginScreenState,
      sermonVideoScreenState: sermonVideoScreenState ?? this.sermonVideoScreenState,
    );
  }
}
