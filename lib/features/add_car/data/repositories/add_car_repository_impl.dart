import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/add_car/data/datasources/add_car_remote_data_source.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:carco/features/add_car/data/repositories/add_car_repository.dart';

class AddCarRepositoryImpl implements AddCarRepository {
  final AddCarRemoteDataSource remoteDataSource;

  AddCarRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> addCar(AddCarParams params) async {
    try {
      await remoteDataSource.addCar(params);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
