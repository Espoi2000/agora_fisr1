class TaskModel {
  String title;
  int id;

  TaskModel({required this.title, required this.id});
}

List<TaskModel> taks = [
  TaskModel(title: "Laver les habit", id: 0),
  TaskModel(title: "Laver le sol", id: 1),
  TaskModel(title: "chercher de l'eau ", id: 2),
  TaskModel(title: "eteindre la lumiere", id: 3),
  TaskModel(title: "laver la douche ", id: 4),
  TaskModel(title: "laver les fenetre", id: 5),
  TaskModel(title: "laver le sol ", id: 6),
  TaskModel(title: "laver la machine ", id: 7),
  TaskModel(title: "partir au champ", id: 8),
  TaskModel(title: "partir a limbe", id: 9),
  TaskModel(title: "partir a bue", id: 10),
];
