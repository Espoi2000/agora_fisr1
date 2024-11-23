class TaskModel {
  String title;
  int id;
  bool isCheked;
  TaskModel({required this.title, required this.id, required this.isCheked});
}

List<TaskModel> taks = [
  TaskModel(title: "Laver les habit", id: 0, isCheked: false),
  TaskModel(title: "Laver le sol", id: 1, isCheked: false),
  TaskModel(title: "chercher de l'eau ", id: 2, isCheked: false),
  TaskModel(title: "eteindre la lumiere", id: 3, isCheked: false),
  TaskModel(title: "laver la douche ", id: 4, isCheked: false),
  TaskModel(title: "laver les fenetre", id: 5, isCheked: false),
  TaskModel(title: "laver le sol ", id: 6, isCheked: false),
  TaskModel(title: "laver la machine ", id: 7, isCheked: false),
  TaskModel(title: "partir au champ", id: 8, isCheked: false),
  TaskModel(title: "partir a limbe", id: 9, isCheked: false),
  TaskModel(title: "partir a bue", id: 10, isCheked: false),
];
