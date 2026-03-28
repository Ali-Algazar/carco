import 'package:carco/features/home/data/models/car_model.dart';

class HomeCustomerModel {
  final List<String> categories;
  final List<CarModel> featuredCars;

  HomeCustomerModel({required this.categories, required this.featuredCars});

  factory HomeCustomerModel.fromJson(Map<String, dynamic> json) {
    return HomeCustomerModel(
      categories: List<String>.from(json['categories'] ?? []),
      featuredCars: List<CarModel>.from(
        (json['featuredCars'] ?? []).map((x) => CarModel.fromJson(x)),
      ),
    );
  }
}
