import 'package:counter_cubit_2_4/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitState());

  int counter = 0;
  // add
  add() {
    counter++;
    emit(CounterUpdateState());
  }

  // remove
  remove() {
    counter--;
    emit(CounterUpdateState());
  }
}
