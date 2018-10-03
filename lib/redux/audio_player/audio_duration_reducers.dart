import 'package:buddish_project/redux/audio_player/audio_duration_action.dart';
import 'package:buddish_project/redux/audio_player/audio_player_state.dart';
import 'package:redux/redux.dart';

final audioDurationReducers = combineReducers<AudioPlayerState>([
  TypedReducer<AudioPlayerState, SetDuration>(_setDuration),
  TypedReducer<AudioPlayerState, OnPositionChanged>(_setPosition),
]);

AudioPlayerState _setDuration(
  AudioPlayerState state,
  SetDuration action,
) {
  return state.copyWith(duration: action.duration);
}

AudioPlayerState _setPosition(
  AudioPlayerState state,
  OnPositionChanged action,
) {
  return state.copyWith(position: action.position);
}
