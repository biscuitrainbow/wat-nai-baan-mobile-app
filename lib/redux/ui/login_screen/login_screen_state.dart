import 'package:buddish_project/data/loading_status.dart';
import 'package:meta/meta.dart';

class LoginScreenState {
  final LoadingStatus loadingStatus;

  LoginScreenState({
    @required this.loadingStatus,
  });

  factory LoginScreenState.initial() {
    return LoginScreenState(loadingStatus: LoadingStatus.initial);
  }

  LoginScreenState copyWith({LoadingStatus loadingStatus}) {
    return LoginScreenState(loadingStatus: loadingStatus ?? this.loadingStatus);
  }
}
