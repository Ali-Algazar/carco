import 'package:carco/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getProfileData();
}
