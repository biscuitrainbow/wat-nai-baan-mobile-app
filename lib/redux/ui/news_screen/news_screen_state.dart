import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class NewsScreenState {
  final LoadingStatus loadingStatus;

  NewsScreenState({
    @required this.loadingStatus,
  });

  factory NewsScreenState.initial() {
    return NewsScreenState(
      loadingStatus: LoadingStatus.initial,
    );
  }

  NewsScreenState copyWith({LoadingStatus loadingStatus}) {
    return NewsScreenState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
