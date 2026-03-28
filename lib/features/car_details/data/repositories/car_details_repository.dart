import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/car_details/data/models/car_details_model.dart';

abstract class CarDetailsRepository {
  Future<Either<Failure, CarDetailsModel>> getCarDetails(String carId);
}
