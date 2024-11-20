part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int count;
  const CounterState({required this.count});
}

final class CounterInitial extends CounterState {
  const CounterInitial({required super.count});
}

class CurrentCount extends CounterState {
  const CurrentCount({required super.count});
}
