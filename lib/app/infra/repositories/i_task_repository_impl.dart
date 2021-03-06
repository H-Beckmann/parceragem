import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failures/server_failures.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../core/http/parceragem_client.dart';
import '../models/task_model.dart';

class ITaskRepositoryImpl extends TaskRepository {
  final ParceragemClient client;

  ITaskRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<TaskEntity>>> getTasks(String id) async {
    try {
      final List<TaskEntity> tasksList = [];
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await client.get(
        'service/tasks/$id',
        options: Options(
          headers: {
            "authorization": "Bearer $token",
          },
        ),
      );
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        tasksList.add(TaskModel.fromMap(list[i]).toEntity());
      }

      return right(tasksList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}
