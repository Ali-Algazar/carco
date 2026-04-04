import 'package:carco/features/home/data/models/car_model.dart';

class HomeCustomerModel {
  final List<String> categories;
  final List<CarModel> featuredCars; // عربيات المستخدمين
  final List<CarModel> showroomCars; // 👈 عربيات المعرض (الأدمن)

  HomeCustomerModel({
    required this.categories,
    required this.featuredCars,
    required this.showroomCars,
  });
}
