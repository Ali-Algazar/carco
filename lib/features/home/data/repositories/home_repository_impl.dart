import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/home/data/datasources/home_remote_data_source.dart';
import 'package:carco/features/home/data/models/home_customer_model.dart';
import 'package:carco/features/home/data/repositories/home_repository.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, HomeCustomerModel>> getHomeData() async {
    try {
      final homeData = await remoteDataSource.getHomeData();
      return Right(homeData);
    } catch (e) {
      if (e is DioException && e.response != null) {
        return Left(
          ServerFailure(
            e.response?.data['message'] ?? 'حدث خطأ أثناء جلب البيانات',
          ),
        );
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
