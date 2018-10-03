import 'package:buddish_project/constants.dart';
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

  @override
  String toString() {
    return 'Mantra{name: $name, url: $url, isPlaying: $isPlaying}';
  }

  static List<Mantra> generate() {
    return [
      Mantra(name: 'สวดมนต์ทำวัตรเช้า', url: AppAsset.audio1, isPlaying: false),
      Mantra(name: 'สวดมนต์ทำวัตรเย็น', url: AppAsset.audio2, isPlaying: false),
      Mantra(name: 'บทสวดทำวัตรเช้า แปล', url: AppAsset.audio6, isPlaying: false),
      Mantra(name: 'บทสวดทำวัตรเย็น แปล ', url: AppAsset.audio7, isPlaying: false),
      Mantra(name: 'สวดมนต์ประจำวัน', url: AppAsset.audio3, isPlaying: false),
      Mantra(name: 'สวดมนต์ก่อนนอน', url: AppAsset.audio4, isPlaying: false),
      Mantra(name: 'สวดมนต์แผ่เมตตา', url: AppAsset.audio5, isPlaying: false),
    ];
  }
}
