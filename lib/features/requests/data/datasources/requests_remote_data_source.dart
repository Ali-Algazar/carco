import 'package:carco/core/services/api_helper.dart';
import 'package:carco/features/requests/data/models/my_car_model.dart';

abstract class MyCarsRemoteDataSource {
  Future<List<MyCarModel>> getMyCars();
  Future<void> deleteCar(String carId);
}

class MyCarsRemoteDataSourceImpl implements MyCarsRemoteDataSource {
  final ApiHelper apiHelper;

  MyCarsRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<List<MyCarModel>> getMyCars() async {
    final response = await apiHelper.get(
      '/carsuser/my/cars',
      requiresAuth: true,
    );

    List<dynamic> data = response.data;

    return data.map((json) => MyCarModel.fromJson(json)).toList();
  }

  @override
  Future<void> deleteCar(String carId) async {
    await apiHelper.delete('/carsuser/$carId', requiresAuth: true);
  }
}
