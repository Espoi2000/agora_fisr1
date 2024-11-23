part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  final List<TaskModel> taks;
  const TodoState({required this.taks});
}

final class TodoInitial extends TodoState {
  const TodoInitial({required super.taks});
}

final class TodoAddState extends TodoState {
  const TodoAddState({required super.taks});
}

final class TodoDeleteState extends TodoState {
  const TodoDeleteState({required super.taks});
}

final class TodoUpdateState extends TodoState {
  const TodoUpdateState({required super.taks});
}
