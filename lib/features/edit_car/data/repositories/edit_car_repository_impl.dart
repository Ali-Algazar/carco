import 'package:carco/features/edit_car/data/datasources/edit_car_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:dio/dio.dart';
import 'edit_car_repository.dart';

class EditCarRepositoryImpl implements EditCarRepository {
  final EditCarRemoteDataSource remoteDataSource;

  EditCarRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> updateCar(
    String carId,
    AddCarParams params,
  ) async {
    try {
      await remoteDataSource.updateCar(carId, params);
      return const Right(unit);
    } catch (e) {
      if (e is DioException && e.response != null) {
        return Left(
          ServerFailure(e.response?.data['message'] ?? 'فشل تعديل السيارة'),
        );
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
