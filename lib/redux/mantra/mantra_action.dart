import 'package:buddish_project/data/model/mantra.dart';

class Play {
  final Mantra mantra;
  final int index;

  Play(
    this.index,
    this.mantra,
  );
}

class Stop {
  final int index;
  final Mantra mantra;

  Stop(
    this.index,
    this.mantra,
  );
}

class Seek {
  final double position;

  Seek(this.position);
}

class ClearPlaying {}
