import 'package:dartz/dartz.dart';

import '../core/failures/server_failures.dart';
import '../entities/profession_entity.dart';

abstract class IProfessionRepository {
  Future<Either<ServerFailures, List<ProfessionEntity>>> getProfessions(
      String id);
}
