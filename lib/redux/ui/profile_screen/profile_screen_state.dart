import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class ProfileScreenState {
  final LoadingStatus loadingStatus;

  ProfileScreenState({
    @required this.loadingStatus,
  });

  factory ProfileScreenState.initial() {
    return ProfileScreenState(loadingStatus: LoadingStatus.initial);
  }

  ProfileScreenState copyWith({LoadingStatus loadingStatus}) {
    return ProfileScreenState(loadingStatus: loadingStatus ?? this.loadingStatus);
  }
}
