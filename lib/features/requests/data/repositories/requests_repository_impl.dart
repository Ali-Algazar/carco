import 'package:carco/features/requests/data/datasources/requests_remote_data_source.dart';
import 'package:carco/features/requests/data/models/my_car_model.dart';
import 'package:carco/features/requests/data/repositories/requests_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:dio/dio.dart';

class MyCarsRepositoryImpl implements MyCarsRepository {
  final MyCarsRemoteDataSource remoteDataSource;

  MyCarsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MyCarModel>>> getMyCars() async {
    try {
      final cars = await remoteDataSource.getMyCars();
      return Right(cars);
    } catch (e) {
      if (e is DioException && e.response != null) {
        return Left(
          ServerFailure(e.response?.data['message'] ?? 'خطأ في جلب السيارات'),
        );
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCar(String carId) async {
    try {
      await remoteDataSource.deleteCar(carId);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
