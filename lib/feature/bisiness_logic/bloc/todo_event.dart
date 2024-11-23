part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final TaskModel taskModel;
  TodoAddEvent({required this.taskModel});
}

class TodoDeleteEvent extends TodoEvent {
  final TaskModel taskModel;
  TodoDeleteEvent({required this.taskModel});
}

class TodoUpdateEvent extends TodoEvent {
  final String upadeString;
  final int index;
  TodoUpdateEvent({required this.upadeString, required this.index});
}
