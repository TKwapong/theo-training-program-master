import 'package:dio/dio.dart';
import 'package:training_program/model/program_response.dart';

/// Handles all operations related to network requests

class API {
  final _dio = Dio();

  Future<TrainingProgramResponse> searchTrainingPrograms(String search) async {
    Response res = await _dio.get(
      "https://theo-training-program-api.herokuapp.com/training-programs",
      queryParameters: {"search": search},
    );

    return TrainingProgramResponse.fromJSON(res.data);
  }
}
