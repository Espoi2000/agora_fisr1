import 'package:bloc/bloc.dart';
import 'package:debut_pratique/feature/data/model/task_model.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial(taks: [])) {
    on<TodoAddEvent>((event, emit) {
      List<TaskModel> currentTaks = List.from(state.taks)..add(event.taskModel);
      emit(TodoAddState(taks: currentTaks.toList()));
    });

    // delete
    on<TodoDeleteEvent>((event, emit) {
      List<TaskModel> currentTaks = List.from(state.taks)
        ..removeWhere((todo) => todo.id == event.taskModel.id);
      emit(TodoDeleteState(taks: currentTaks.toList()));
    });

    // update
    on<TodoUpdateEvent>((event, emit) {
      print("ici");
      List<TaskModel> upDateTask = List.from(state.taks);
      print(List.from(state.taks));
      if (event.upadeString.isNotEmpty) {
        upDateTask[event.index].title = event.upadeString;
        emit(TodoUpdateState(taks: upDateTask.toList()));
      } else {
        upDateTask[event.index].status = event.status!;
        print(upDateTask[event.index].status = event.status!);
        emit(TodoUpdateState(taks: upDateTask.toList()));
      }
    });
  }
}
