import 'package:dartz/dartz.dart';
import '../../infra/models/auth_model.dart';

import '../core/failures/server_failures.dart';

abstract class AuthRepository {
  Future<Either<ServerFailures, LoginResponseModel>> login(
      LoginRequestModel requestModel);
  Future<Either<ServerFailures, RegisterResponseModel>> register(
      RegisterRequestModel requestModel);
  Future<Either<ServerFailures, Unit>> logout();
  //Future<Either<ServerFailures, String>> forgotPassword();
  //Future<Either<ServerFailures, String>> resetPassword();
}
