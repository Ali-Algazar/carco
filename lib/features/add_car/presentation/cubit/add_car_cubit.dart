import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:carco/features/add_car/data/repositories/add_car_repository.dart';
import 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit(this.addCarRepository) : super(AddCarInitial());

  final AddCarRepository addCarRepository;

  Future<void> addCar(AddCarParams params) async {
    emit(AddCarLoading());
    var result = await addCarRepository.addCar(params);
    result.fold(
      (failure) => emit(AddCarError(failure.message)),
      (_) => emit(AddCarSuccess()),
    );
  }
}
