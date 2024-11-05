import 'package:debut_pratique/todo_list/task_model.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late final TextEditingController addTaskController;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    addTaskController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addTaskController.dispose();
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
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
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
