import 'package:carco/features/home/data/models/car_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<CarModel>> getFavorites();
}

class MockFavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  @override
  Future<List<CarModel>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 1));
    final List<Map<String, dynamic>> mockJson = [
      {
        "id": 1,
        "name": "مرسيدس S-Class 2024",
        "location": "القاهرة",
        "year": "2024",
        "price": 2500000,
        "type": "Sale",
        "image":
            "https://arabgt.com/wp-content/uploads/2022/12/%D9%85%D8%B1%D8%B3%D9%8A%D8%AF%D8%B3-S63-2024-.jpg",
      },
      {
        "id": 4,
        "name": "بورش 911 Carrera",
        "location": "الشيخ زايد",
        "year": "2023",
        "price": 2100000,
        "type": "Sale",
        "image":
            "https://en.drivar.de/wp-content/uploads/2024/11/Rent-a-Porsche-911-Carrera-4-GTS-in-Berlin.jpeg",
      },
    ];

    return mockJson.map((json) => CarModel.fromJson(json)).toList();
  }
}
