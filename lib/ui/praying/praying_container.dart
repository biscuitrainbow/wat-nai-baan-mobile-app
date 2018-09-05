import 'package:buddish_project/data/model/mantra.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/mantra/mantra_action.dart';
import 'package:buddish_project/ui/praying/praying_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PrayingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: PrayingScreenViewModel.fromStore,
      builder: (BuildContext context, PrayingScreenViewModel viewModel) {
        return PrayingScreen(viewModel: viewModel);
      },
    );
  }
}

class PrayingScreenViewModel {
  final List<Mantra> mantras;
  final Function(int index, Mantra mantra) onPlay;
  final Function(int index, Mantra mantra) onStop;

  PrayingScreenViewModel({
    @required this.mantras,
    @required this.onPlay,
    @required this.onStop,
  });

  static PrayingScreenViewModel fromStore(Store<AppState> store) {
    return PrayingScreenViewModel(
      mantras: store.state.mantras,
      onPlay: (int index, Mantra mantra) => store.dispatch(Play(index,mantra)),
      onStop: (int index, Mantra mantra) => store.dispatch(Stop(index,mantra)),
    );
  }
}
