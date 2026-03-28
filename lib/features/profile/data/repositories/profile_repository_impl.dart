import 'package:carco/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:carco/features/profile/data/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
      final profileData = await remoteDataSource.getProfileData();
      return Right(profileData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
