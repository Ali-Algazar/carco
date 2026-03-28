import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:carco/features/edit_car/data/repositories/edit_car_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_car_state.dart';

class EditCarCubit extends Cubit<EditCarState> {
  final EditCarRepository repository;

  EditCarCubit(this.repository) : super(EditCarInitial());

  Future<void> updateCar(String carId, AddCarParams params) async {
    emit(EditCarLoading());
    final result = await repository.updateCar(carId, params);
    result.fold(
      (failure) => emit(EditCarError(failure.message)),
      (_) => emit(EditCarSuccess()),
    );
  }
}
