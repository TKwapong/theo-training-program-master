import 'package:training_program/model/program.dart';

class TrainingProgramResponse {
  final bool success;
  List<TrainingProgram> data;

  TrainingProgramResponse.fromJSON(Map<dynamic, dynamic> json)
      : success = json["success"] {
    data = json["data"]
        .map<TrainingProgram>(
            (programJSON) => TrainingProgram.fromJSON(programJSON))
        .toList();
  }
}
