import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/home/data/models/car_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<CarModel>>> getFavorites();
}
