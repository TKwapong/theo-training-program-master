class TrainingProgram {
  final String name;
  final String duration;
  final String stack;
  final int price;

  TrainingProgram.fromJSON(Map<dynamic, dynamic> json)
      : name = json["name"],
        duration = json["duration"],
        stack = json["development_stack"],
        price = json["price"];
}
