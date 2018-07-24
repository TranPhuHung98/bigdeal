import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:big_deal/app_state.dart';

class AppBloc {
  final _app_state = BehaviorSubject<AppState>();

  updateUser(AppState state) {
    _app_state.add(state);
  }

  Stream<AppState> get appState => _app_state.stream;
}
