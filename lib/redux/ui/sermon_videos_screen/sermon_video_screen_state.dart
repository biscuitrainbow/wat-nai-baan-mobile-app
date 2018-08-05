import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/data/model/Video.dart';
import 'package:meta/meta.dart';

class SermonVideoScreenState {
  final LoadingStatus loadingStatus;
  final List<Video> videos;

  SermonVideoScreenState({
    @required this.loadingStatus,
    @required this.videos,
  });

  factory SermonVideoScreenState.initial() {
    return SermonVideoScreenState(
      loadingStatus: LoadingStatus.initial,
      videos: [],
    );
  }

  SermonVideoScreenState copyWith({
    LoadingStatus loadingStatus,
    List<Video> videos,
  }) {
    return SermonVideoScreenState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      videos: videos ?? this.videos,
    );
  }
}
