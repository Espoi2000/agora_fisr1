part of 'counter_cubit_cubit.dart';

@immutable
sealed class CounterCubitState {
  final int count;
  const CounterCubitState({required this.count});
}

final class CounterCubitInitial extends CounterCubitState {
  const CounterCubitInitial({required super.count});
}

final class CurrentCoutenrCubit extends CounterCubitState {
  const CurrentCoutenrCubit({required super.count});
}
