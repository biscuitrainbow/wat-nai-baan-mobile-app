import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/User.dart';
import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/ui/login_screen/login_screen_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_state.dart';

class AppState {
  final User user;
  final List<Mantra> mantras;
  final LoginScreenState loginScreenState;
  final SermonVideoScreenState sermonVideoScreenState;

  AppState({
    this.user,
    this.mantras,
    this.loginScreenState,
    this.sermonVideoScreenState,
  });

  factory AppState.initial() {
    return AppState(
      user: null,
      mantras: [
        Mantra(name: 'สวดมนต์ทำวัดเช้า', url: Asset.audio1, isPlaying: true),
        Mantra(name: 'สวดมนต์ทำวัดเย็น', url: Asset.audio2, isPlaying: false),
        Mantra(name: 'สวดมนต์ประจำวัน', url: Asset.audio3, isPlaying: false),
        Mantra(name: 'สวดมนต์ก่อนนอน', url: Asset.audio4, isPlaying: false),
        Mantra(name: 'สวดมนต์แผ่เมตตรา', url: Asset.audio5, isPlaying: false),
      ],
      loginScreenState: LoginScreenState.initial(),
      sermonVideoScreenState: SermonVideoScreenState.initial(),
    );
  }

  AppState copyWith({
    User user,
    List<Mantra> mantras,
    LoginScreenState loginScreenState,
    SermonVideoScreenState sermonVideoScreenState,
  }) {
    return AppState(
      user: user ?? this.user,
      mantras: mantras ?? this.mantras,
      loginScreenState: loginScreenState ?? this.loginScreenState,
      sermonVideoScreenState: sermonVideoScreenState ?? this.sermonVideoScreenState,
    );
  }
}
