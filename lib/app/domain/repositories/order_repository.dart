import 'package:dartz/dartz.dart';
import '../core/failures/server_failures.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<ServerFailures, List<OrderEntity>>> getOrders();
  Future<Either<ServerFailures, List<OrderEntity>>> getPendingOrders(String id);
  Future<Either<ServerFailures, List<OrderEntity>>> getOrdersByProfessional();
  Future<Either<ServerFailures, Unit>> addOrder(Map<String, dynamic> map);
  Future<Either<ServerFailures, String>> updateOrder();
  Future<Either<ServerFailures, Unit>> cancelOrder(String id);
}
