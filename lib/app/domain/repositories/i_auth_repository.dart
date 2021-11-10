import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';

abstract class IAuthRepository {
  Future<Either<ServerFailures, String>> register();
  Future<Either<ServerFailures, String>> login();
  //Future<Either<ServerFailures, String>> forgotPassword();
  //Future<Either<ServerFailures, String>> resetPassword();
}