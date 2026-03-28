import 'package:carco/core/services/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';

abstract class AddCarRemoteDataSource {
  Future<void> addCar(AddCarParams params);
}

class AddCarRemoteDataSourceImpl implements AddCarRemoteDataSource {
  final ApiHelper apiHelper;

  AddCarRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<void> addCar(AddCarParams params) async {
    Map<String, dynamic> dataMap = {
      "name": "${params.brand} ${params.model}",
      "price": num.parse(params.price),
      "type": params.offerType,
      "year": int.parse(params.year),
      "description": params.description,
      "fuelType": params.fuelType,
      "ownerName": params.ownerName,
      "ownerPhone": params.ownerPhone,
      "mileage": params.mileage,
      "ownerAddress[city]": params.location,
    };

    FormData formData = FormData.fromMap(dataMap);

    for (String path in params.images) {
      formData.files.add(
        MapEntry(
          "images",
          await MultipartFile.fromFile(path, filename: path.split('/').last),
        ),
      );
    }

    if (params.videoPath != null && params.videoPath!.isNotEmpty) {
      formData.files.add(
        MapEntry(
          "video",
          await MultipartFile.fromFile(
            params.videoPath!,
            filename: params.videoPath!.split('/').last,
          ),
        ),
      );
    }

    await apiHelper.post(
      '/carsuser',
      data: formData,
      requiresAuth: true,
      isMultipart: true,
    );
  }
}
