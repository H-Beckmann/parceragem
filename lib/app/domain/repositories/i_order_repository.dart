import 'package:dartz/dartz.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/entities/order_entity.dart';

abstract class IOrderRepository {
  Future<Either<ServerFailures, List<OrderEntity>>> getOrders();
  Future<Either<ServerFailures, List<OrderEntity>>> getPendingOrders();
  Future<Either<ServerFailures, List<OrderEntity>>> getOrdersByAuth();
  Future<Either<ServerFailures, String>> addOrder();
  Future<Either<ServerFailures, String>> updateOrder();
  Future<Either<ServerFailures, String>> cancelOrder();
}
