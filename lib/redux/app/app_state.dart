import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/profile_screen/profile_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';

class AppState {
  final User user;
  final String token;
  final List<Mantra> mantras;
  final LoginScreenState loginScreenState;
  final SermonVideoScreenState sermonVideoScreenState;
  final ProfileScreenState profileScreenState;

  AppState({
    this.user,
    this.token,
    this.mantras,
    this.loginScreenState,
    this.sermonVideoScreenState,
    this.profileScreenState,
  });

  factory AppState.initial() {
    return AppState(
      user: null,
      token: null,
      mantras: Mantra.generate(),
      loginScreenState: LoginScreenState.initial(),
      sermonVideoScreenState: SermonVideoScreenState.initial(),
      profileScreenState: ProfileScreenState.initial(),
    );
  }

  AppState copyWith({
    User user,
    String token,
    List<Mantra> mantras,
    LoginScreenState loginScreenState,
    SermonVideoScreenState sermonVideoScreenState,
    ProfileScreenState profileScreenState,
  }) {
    return AppState(
      user: user ?? this.user,
      token: token ?? this.token,
      mantras: mantras ?? this.mantras,
      loginScreenState: loginScreenState ?? this.loginScreenState,
      sermonVideoScreenState: sermonVideoScreenState ?? this.sermonVideoScreenState,
      profileScreenState: profileScreenState ?? this.profileScreenState,
    );
  }

  @override
  String toString() {
    return 'AppState{user: $user, token: $token, mantras: $mantras, loginScreenState: $loginScreenState, sermonVideoScreenState: $sermonVideoScreenState, profileScreenState: $profileScreenState}';
  }


}
