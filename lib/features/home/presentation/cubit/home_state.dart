import 'package:carco/features/home/data/models/home_customer_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeCustomerModel homeData;
  HomeLoaded(this.homeData);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
