import 'package:carco/core/services/api_helper.dart';
import 'package:carco/features/car_details/data/models/car_details_model.dart';

abstract class CarDetailsRemoteDataSource {
  Future<CarDetailsModel> getCarDetails(String carId);
}

class CarDetailsRemoteDataSourceImpl implements CarDetailsRemoteDataSource {
  final ApiHelper apiHelper;

  CarDetailsRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<CarDetailsModel> getCarDetails(String carId) async {
    final response = await apiHelper.get(
      '/carsuser/$carId',
      requiresAuth: true,
    );

    final carData = response.data['car'] ?? response.data;

    return CarDetailsModel.fromJson(carData);
  }
}
