import 'package:carco/core/services/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';

abstract class EditCarRemoteDataSource {
  Future<void> updateCar(String carId, AddCarParams params);
}

class EditCarRemoteDataSourceImpl implements EditCarRemoteDataSource {
  final ApiHelper apiHelper;

  EditCarRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<void> updateCar(String carId, AddCarParams params) async {
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
      if (path.startsWith('http')) {
        formData.fields.add(MapEntry("existingImages", path));
      } else {
        formData.files.add(
          MapEntry(
            "images",
            await MultipartFile.fromFile(path, filename: path.split('/').last),
          ),
        );
      }
    }

    if (params.videoPath != null &&
        params.videoPath!.isNotEmpty &&
        !params.videoPath!.startsWith('http')) {
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

    await apiHelper.put(
      '/carsuser/$carId',
      data: formData,
      requiresAuth: true,
      isMultipart: true,
    );
  }
}
