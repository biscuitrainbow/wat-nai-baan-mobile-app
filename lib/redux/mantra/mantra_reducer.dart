import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/mantra/mantra_action.dart';
import 'package:redux/redux.dart';

final mantrasReducers = combineReducers<List<Mantra>>([
  TypedReducer<List<Mantra>, Play>(_play),
  TypedReducer<List<Mantra>, Stop>(_stop),
  TypedReducer<List<Mantra>, ClearPlaying>(_clearPlaying),
]);

List<Mantra> _play(
  List<Mantra> state,
  Play action,
) {
  print('start reducers');

  var mantra = state[action.index].copyWith(isPlaying: true);
  var mantras = List.from<Mantra>(state);

  mantras[action.index] = mantra;

  return mantras;
}

List<Mantra> _stop(
  List<Mantra> state,
  Stop action,
) {
  print('stop reducers');

  var mantra = state[action.index].copyWith(isPlaying: false);
  var mantras = List.from<Mantra>(state);

  mantras[action.index] = mantra;

  return mantras;
}

List<Mantra> _clearPlaying(
  List<Mantra> state,
  ClearPlaying action,
) {
  print('clear playing');

  final mantras = state.map((Mantra mantra) {
    final stoppedMantra = mantra.copyWith(isPlaying: false);
    return stoppedMantra;
  }).toList();

  return mantras;
}
