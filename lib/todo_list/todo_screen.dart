import 'package:debut_pratique/todo_list/task_model.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
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
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.white,
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
                  IconButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print("validé");
                          print(addTaskController.text);

                          setState(() {
                            taks.insert(
                              0,
                              TaskModel(
                                  title: addTaskController.text,
                                  id: taks.length + 1,
                                  isCheked: false),
                            );

                            // taks.add();
                          });

                          addTaskController.clear();
                        }
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            // render des elements avec la listView
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: taks.length,
                  itemBuilder: (BuildContext context, int index) {
                    TaskModel taskModel = taks[index];
                    return ListTile(
                      title: Text(
                        taskModel.title,
                        style: TextStyle(
                            decoration: taskModel.isCheked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Checkbox(
                                value: taskModel.isCheked,
                                onChanged: (value) {
                                  setState(() {
                                    taks[index].isCheked = value!;
                                  });
                                }),
                            IconButton(
                                onPressed: () {
                                  updateTaskController.text = taskModel.title;
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirmation"),
                                        content: Form(
                                          key: updateFormkey,
                                          child: TextFormField(
                                            controller: updateTaskController,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Modifier une tâche",
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
                                        actions: [
                                          TextButton(
                                            child: const Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Ferme la boîte de dialogue
                                            },
                                          ),
                                          TextButton(
                                            child: const Text("Confirm"),
                                            onPressed: () {
                                              //
                                              setState(() {
                                                taks[index].title =
                                                    updateTaskController.text;
                                              });
                                              //
                                              Navigator.of(context)
                                                  .pop(); // Ferme la boîte de dialogue
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // taks.removeAt(index);

                                    taks.removeWhere((element) =>
                                        element.id == taskModel.id);
                                  });
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
