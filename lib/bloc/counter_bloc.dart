import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(count: 0)) {
    on<IncrementEvent>((event, emit) {
      var currentState = state.count + 1;
      emit(CurrentCount(count: currentState));
    });

    on<DecrementEvent>((event, emit) {
      var currentState = state.count - 1;
      emit(CurrentCount(count: currentState));
    });
  }
}
