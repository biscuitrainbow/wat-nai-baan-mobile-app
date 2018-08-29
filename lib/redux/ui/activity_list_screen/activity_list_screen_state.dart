import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class ActivityListScreenState {
  final LoadingStatus loadingStatus;

  ActivityListScreenState({
    @required this.loadingStatus,
  });

  factory ActivityListScreenState.initial() {
    return ActivityListScreenState(
      loadingStatus: LoadingStatus.initial,
    );
  }

  ActivityListScreenState copyWith({LoadingStatus loadingStatus}) {
    return ActivityListScreenState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
