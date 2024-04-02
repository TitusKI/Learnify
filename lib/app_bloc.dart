import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialState()) {
    on<Increment> ((event, emit){
      emit(AppState(counter: state.counter + 1));
      print(state.counter);
    });
  }
}
