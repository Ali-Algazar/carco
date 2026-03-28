import 'package:carco/core/services/api_helper.dart';
import 'package:carco/features/home/data/models/car_model.dart';
import 'package:carco/features/home/data/models/home_customer_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeCustomerModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiHelper apiHelper;

  HomeRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<HomeCustomerModel> getHomeData() async {
    final response = await apiHelper.get(
      '/carsuser/all-for-sale',
      requiresAuth: false,
    );

    List<dynamic> data = response.data;

    List<CarModel> apiCars = data
        .map((json) => CarModel.fromJson(json))
        .toList();

    List<String> categories = ["الكل", "للبيع", "للإيجار"];

    return HomeCustomerModel(categories: categories, featuredCars: apiCars);
  }
}
