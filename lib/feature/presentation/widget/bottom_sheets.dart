import 'package:debut_pratique/feature/bisiness_logic/bloc/todo_bloc.dart';
import 'package:debut_pratique/feature/data/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomChangeStatut extends StatelessWidget {
  const BottomChangeStatut(
      {super.key, required this.size, required this.indexed});

  final Size size;
  final int indexed;
  @override
  Widget build(BuildContext context) {
    List<String> taskStatutName = ["En attent ", "En cours ", "Terminé"];
    int currentState = 0;
    return Container(
      width: size.width,
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: taskStatutName.length,
                    itemBuilder: (BuildContext context, int index) {
                      String statusName = taskStatutName[index];
                      TaskModel taskModel = state.taks[indexed];
                      return GestureDetector(
                        onTap: () {
                          currentState = index;
                          BlocProvider.of<TodoBloc>(context).add(
                            TodoUpdateEvent(
                              index: indexed,
                              upadeString: '',
                              status: index == 0
                                  ? TaskStatus.pending
                                  : index == 1
                                      ? TaskStatus.progress
                                      : TaskStatus.end,
                            ),
                          );
                        },
                        child: Container(
                          width: size.width,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: index == 0
                                    ? const Color.fromARGB(255, 75, 33, 243)
                                    : index == 1
                                        ? Colors.green
                                        : Colors.red,
                                width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                statusName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: index == 0
                                      ? const Color.fromARGB(255, 75, 33, 243)
                                      : index == 1
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: index == 0
                                          ? const Color.fromARGB(
                                              255, 75, 33, 243)
                                          : index == 1
                                              ? Colors.green
                                              : Colors.red,
                                      width: 2),
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentState == index
                                          ? const Color.fromARGB(
                                              255, 75, 33, 243)
                                          : Colors.transparent),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
