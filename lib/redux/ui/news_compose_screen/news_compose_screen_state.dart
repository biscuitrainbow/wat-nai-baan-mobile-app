import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class NewsComposeScreenState {
  final LoadingStatus loadingStatus;

  NewsComposeScreenState({
    @required this.loadingStatus,
  });

  factory NewsComposeScreenState.initial() {
    return NewsComposeScreenState(loadingStatus: LoadingStatus.initial);
  }

  NewsComposeScreenState copyWith({LoadingStatus loadingStatus}) {
    return NewsComposeScreenState(loadingStatus: loadingStatus ?? this.loadingStatus);
  }
}
