import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class NewsListScreenState {
  final LoadingStatus loadingStatus;

  NewsListScreenState({
    @required this.loadingStatus,
  });

  factory NewsListScreenState.initial() {
    return NewsListScreenState(
      loadingStatus: LoadingStatus.initial,
    );
  }

  NewsListScreenState copyWith({LoadingStatus loadingStatus}) {
    return NewsListScreenState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
