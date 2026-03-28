import 'package:carco/features/car_details/data/models/car_details_model.dart';

abstract class CarDetailsState {}

class CarDetailsInitial extends CarDetailsState {}

class CarDetailsLoading extends CarDetailsState {}

class CarDetailsLoaded extends CarDetailsState {
  final CarDetailsModel car;
  CarDetailsLoaded(this.car);
}

class CarDetailsError extends CarDetailsState {
  final String message;
  CarDetailsError(this.message);
}
