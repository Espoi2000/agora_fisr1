class TaskModel {
  String title;
  int id;
  TaskStatus status;
  TaskModel({required this.title, required this.id, required this.status});
}

enum TaskStatus {
  pending,
  progress,
  end,
}
