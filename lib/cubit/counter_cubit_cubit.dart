import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(const CounterCubitInitial(count: 0));

  void incrementCount() {
    emit(CurrentCoutenrCubit(count: state.count + 1));
  }

  void deccrementCount() {
    emit(CurrentCoutenrCubit(count: state.count - 1));
  }
}
