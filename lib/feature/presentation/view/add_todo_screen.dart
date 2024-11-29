import 'package:debut_pratique/feature/bisiness_logic/bloc/todo_bloc.dart';
import 'package:debut_pratique/feature/data/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController addTaskController;
  late final TextEditingController updateTaskController;

  final formkey = GlobalKey<FormState>();
  final updateFormkey = GlobalKey<FormState>();

  @override
  void initState() {
    addTaskController = TextEditingController();
    updateTaskController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addTaskController.dispose();
    updateTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajout de la tache ",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                          controller: addTaskController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ajouter une tâche",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Veuillez saisir une tâche";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // render des elements avec la listView
            TextButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  BlocProvider.of<TodoBloc>(context).add(
                    TodoAddEvent(
                      taskModel: TaskModel(
                        title: addTaskController.text,
                        id: context.read<TodoBloc>().state.taks.length + 1,
                        status: TaskStatus.pending,
                      ),
                    ),
                  );

                  addTaskController.clear();
                }
              },
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.green),
                maximumSize: WidgetStatePropertyAll(MediaQuery.sizeOf(context)),
                textStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              child: const Text("Ajouter la tache"),
            )
          ],
        ),
      ),
    );
  }
}
