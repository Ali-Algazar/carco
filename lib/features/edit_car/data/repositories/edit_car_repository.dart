import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';

abstract class EditCarRepository {
  Future<Either<Failure, Unit>> updateCar(String carId, AddCarParams params);
}
