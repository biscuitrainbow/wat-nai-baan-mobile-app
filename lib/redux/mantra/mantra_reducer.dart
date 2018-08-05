import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/mantra/mantra_action.dart';
import 'package:redux/redux.dart';

final mantrasReducers = combineReducers<List<Mantra>>([
  new TypedReducer<List<Mantra>, Play>(_play),
  new TypedReducer<List<Mantra>, Stop>(_stop),
]);

List<Mantra> _play(
  List<Mantra> state,
  Play action,
) {
  var mantra = state[action.index].copyWith(isPlaying: true);
  var mantras = List.from<Mantra>(state);

  mantras[action.index] = mantra;

  return mantras;
}

List<Mantra> _stop(
  List<Mantra> state,
  Stop action,
) {
  var mantra = state[action.index].copyWith(isPlaying: false);
  var mantras = List.from<Mantra>(state);

  mantras[action.index] = mantra;

  return mantras;
}
