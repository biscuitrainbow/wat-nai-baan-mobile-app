import 'package:audioplayer/audioplayer.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/audio_player/audio_duration_action.dart';
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
    TypedMiddleware<AppState, Seek>(
      _seek(audioService),
    ),
  ];
}

Middleware<AppState> _play(
  AudioService audioService,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is Play) {
      audioService.stop();

      await audioService.play(action.mantra.url);

      audioService.audioPlugin.onAudioPositionChanged.listen((Duration position) => next(OnPositionChanged(position)));
      audioService.audioPlugin.onPlayerStateChanged.listen((AudioPlayerState state) async {
        if (state == AudioPlayerState.PLAYING) {
          next(SetDuration(audioService.audioPlugin.duration));
        }

        if (state == AudioPlayerState.COMPLETED || state == AudioPlayerState.STOPPED) {
          next(SetDuration(Duration()));
          next(OnPositionChanged(Duration()));
          next(ClearPlaying());
        }
      });
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

Middleware<AppState> _seek(
  AudioService audioService,
) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is Seek) {
      audioService.audioPlugin.seek((action.position / 1000).roundToDouble());
    }
    next(action);
  };
}
