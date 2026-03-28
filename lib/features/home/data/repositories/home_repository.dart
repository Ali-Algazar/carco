import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/home/data/models/home_customer_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeCustomerModel>> getHomeData();
}
