import 'package:carco/core/constants.dart';
import 'package:carco/core/helper/hive_helper.dart';
import 'package:carco/features/auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getProfileData();
}

class MockProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<UserModel> getProfileData() async {
    await Future.delayed(const Duration(seconds: 1));

    final user =
        await HiveHelper.getData(
              boxName: Constants.userBox,
              key: Constants.userHiveKey,
            )
            as UserModel;

    return user;
  }
}
