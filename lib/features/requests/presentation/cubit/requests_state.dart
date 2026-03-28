import 'package:carco/features/requests/data/models/my_car_model.dart';

abstract class MyCarsState {}

class MyCarsInitial extends MyCarsState {}

class MyCarsLoading extends MyCarsState {}

class MyCarsLoaded extends MyCarsState {
  final List<MyCarModel> cars;
  MyCarsLoaded(this.cars);
}

class MyCarsError extends MyCarsState {
  final String message;
  MyCarsError(this.message);
}
