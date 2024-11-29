import 'package:debut_pratique/feature/presentation/view/display_all_task_screen.dart';
import 'package:flutter/material.dart';

class TodoTabBardScreen extends StatefulWidget {
  const TodoTabBardScreen({super.key});

  @override
  State<TodoTabBardScreen> createState() => _TodoTabBardScreenState();
}

class _TodoTabBardScreenState extends State<TodoTabBardScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabbar"),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Pending",
            ),
            Tab(
              text: "Progress",
            ),
            Tab(
              text: "End",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [



          
          DisplayAllTaskScreen(size: size),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.blue,
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.amber,
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.deepOrangeAccent,
          ),
        ],
      ),
    );
  }
}
