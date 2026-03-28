import 'package:carco/features/requests/data/models/my_car_model.dart';
import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';

abstract class MyCarsRepository {
  Future<Either<Failure, List<MyCarModel>>> getMyCars();
  Future<Either<Failure, Unit>> deleteCar(String carId);
}
