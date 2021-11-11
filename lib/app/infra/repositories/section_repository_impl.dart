import 'package:dio/dio.dart';
import '../../domain/entities/section_entity.dart';
import '../../domain/core/failures/server_failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/i_section_repository.dart';
import '../core/http/ParceragemClient.dart';
import '../models/section_model.dart';

class SectionRepositoryImpl extends ISectionRepository {
  final ParceragemClient client;

  SectionRepositoryImpl(this.client);

  @override
  Future<Either<ServerFailures, List<SectionEntity>>> getSections() async {
    try {
      final List<SectionEntity> sectionList = [];

      final response = await client.get('service/sections');
      final List list = response.data!['data'];

      for (var i = 0; i < list.length; i++) {
        sectionList.add(SectionModel.fromMap(list[i]).toEntity());
      }

      return right(sectionList);
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return left(ServerFailures.notFound);
      }
      return left(ServerFailures.serverError);
    }
  }
}