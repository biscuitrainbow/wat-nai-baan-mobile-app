import 'package:meta/meta.dart';

class Mantra {
  final String name;
  final String url;
  final bool isPlaying;

  Mantra({
    @required this.name,
    @required this.url,
    @required this.isPlaying,
  });

  Mantra copyWith({
    String name,
    String url,
    bool isPlaying,
  }) {
    return Mantra(
      name: name ?? this.name,
      url: url ?? this.url,
      isPlaying: isPlaying ?? isPlaying,
    );
  }
}
