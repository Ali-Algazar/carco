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
    final userCarsFuture = apiHelper.get(
      '/carsuser/all-for-sale',
      requiresAuth: false,
    );
    final adminCarsFuture = apiHelper.get('/cars', requiresAuth: false);

    final responses = await Future.wait([userCarsFuture, adminCarsFuture]);

    List<dynamic> userData = responses[0].data;
    List<CarModel> userCars = userData
        .map((json) => CarModel.fromJson(json, isAdmin: false))
        .toList();

    List<dynamic> adminData = responses[1].data['cars'] ?? [];
    List<CarModel> adminCars = adminData
        .map((json) => CarModel.fromJson(json, isAdmin: true))
        .toList();

    List<String> categories = ["الكل", "للبيع", "للإيجار"];

    return HomeCustomerModel(
      categories: categories,
      featuredCars: userCars,
      showroomCars: adminCars, // 👈 تمرير عربيات المعرض مفصولة
    );
  }
}
