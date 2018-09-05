import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/mantra/mantra_action.dart';
import 'package:buddish_project/service/audio_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMantraMiddleware(
  AudioService audioService,
) {
  return [
    TypedMiddleware<AppState, Play>(
      _play(audioService),
    ),
    TypedMiddleware<AppState, Stop>(
      _stop(audioService),
    ),
  ];
}

Middleware<AppState> _play(
  AudioService audioService,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is Play) {
      audioService.stop();
      audioService.play(action.mantra.url);
    }

    next(ClearPlaying());
    next(action);
  };
}

Middleware<AppState> _stop(
  AudioService audioService,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is Stop) {
      audioService.stop();
    }
    next(action);
  };
}
