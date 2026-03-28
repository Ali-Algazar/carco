import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/car_details/data/datasources/car_details_remote_data_source.dart';
import 'package:carco/features/car_details/data/models/car_details_model.dart';
import 'package:carco/features/car_details/data/repositories/car_details_repository.dart';

class CarDetailsRepositoryImpl implements CarDetailsRepository {
  final CarDetailsRemoteDataSource remoteDataSource;

  CarDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CarDetailsModel>> getCarDetails(String carId) async {
    try {
      final carDetails = await remoteDataSource.getCarDetails(carId);
      return Right(carDetails);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
