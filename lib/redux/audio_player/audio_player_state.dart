import 'package:meta/meta.dart';

class AudioPlayerState {
  final Duration position;
  final Duration duration;

  AudioPlayerState({
    @required this.position,
    @required this.duration,
  });

  factory AudioPlayerState.initial() {
    return AudioPlayerState(
      position: Duration(),
      duration: Duration(),
    );
  }

  AudioPlayerState copyWith({
    Duration duration,
    Duration position,
  }) {
    return AudioPlayerState(
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }
}
