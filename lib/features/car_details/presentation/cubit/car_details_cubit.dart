import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/car_details/data/repositories/car_details_repository.dart';
import 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  CarDetailsCubit(this.carDetailsRepository) : super(CarDetailsInitial());

  final CarDetailsRepository carDetailsRepository;

  Future<void> fetchCarDetails(String carId) async {
    emit(CarDetailsLoading());
    var result = await carDetailsRepository.getCarDetails(carId);
    result.fold(
      (failure) => emit(CarDetailsError(failure.message)),
      (car) => emit(CarDetailsLoaded(car)),
    );
  }
}
