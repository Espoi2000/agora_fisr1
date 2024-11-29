import 'package:debut_pratique/feature/bisiness_logic/bloc/todo_bloc.dart';
import 'package:debut_pratique/feature/data/model/task_model.dart';
import 'package:debut_pratique/feature/presentation/view/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayAllTaskScreen extends StatelessWidget {
  const DisplayAllTaskScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.taks.isNotEmpty
              ? ListView.builder(
                  itemCount: state.taks.length,
                  itemBuilder: (BuildContext context, int index) {
                    TaskModel taskModel = state.taks[index];
                    return ListTile(
                      title: Text(
                        taskModel.title,
                        // style: TextStyle(
                        //     decoration: taskModel.status
                        //         ? TextDecoration.lineThrough
                        //         : TextDecoration.none),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            // Checkbox(
                            //   value: taskModel.status,
                            //   onChanged: (value) {
                            //     // setState(() {
                            //     //   taks[index].isCheked = value!;
                            //     // });
                            //   },
                            // ),
                            IconButton(
                                onPressed: () {
                                  // updateTaskController.text = taskModel.title;
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (BuildContext context) {
                                  //     return AlertDialog(
                                  //       title: const Text("Confirmation"),
                                  //       content: Form(
                                  //         key: updateFormkey,
                                  //         child: TextFormField(
                                  //           controller: updateTaskController,
                                  //           decoration: const InputDecoration(
                                  //             border: InputBorder.none,
                                  //             hintText: "Modifier une tâche",
                                  //           ),
                                  //           validator: (value) {
                                  //             if (value!.isEmpty) {
                                  //               return "Veuillez saisir une tâche";
                                  //             } else {
                                  //               return null;
                                  //             }
                                  //           },
                                  //         ),
                                  //       ),
                                  //       actions: [
                                  //         TextButton(
                                  //           child: const Text("Cancel"),
                                  //           onPressed: () {
                                  //             Navigator.of(context)
                                  //                 .pop(); // Ferme la boîte de dialogue
                                  //           },
                                  //         ),
                                  //         TextButton(
                                  //           child: const Text("Confirm"),
                                  //           onPressed: () {
                                  //             //
                                  //             BlocProvider.of<TodoBloc>(context)
                                  //                 .add(TodoUpdateEvent(
                                  //                     upadeString:
                                  //                         updateTaskController
                                  //                             .text,
                                  //                     index: index));
                                  //             //
                                  //             Navigator.of(context)
                                  //                 .pop(); // Ferme la boîte de dialogue
                                  //           },
                                  //         ),
                                  //       ],
                                  //     );
                                  //   },
                                  // );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  // BlocProvider.of<TodoBloc>(context).add(
                                  //   TodoDeleteEvent(
                                  //     taskModel: taskModel,
                                  //   ),
                                  // );
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text("Aucune tâche"));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
        label: const Text("Ajouter une tache"),
      ),
    );
  }
}
