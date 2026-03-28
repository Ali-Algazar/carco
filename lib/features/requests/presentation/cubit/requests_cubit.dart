import 'package:carco/features/requests/data/models/my_car_model.dart';
import 'package:carco/features/requests/data/repositories/requests_repository.dart';
import 'package:carco/features/requests/presentation/cubit/requests_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  final MyCarsRepository repository;

  MyCarsCubit(this.repository) : super(MyCarsInitial());

  Future<void> fetchMyCars() async {
    emit(MyCarsLoading());
    final result = await repository.getMyCars();
    result.fold(
      (failure) => emit(MyCarsError(failure.message)),
      (cars) => emit(MyCarsLoaded(cars)),
    );
  }

  Future<void> deleteCar(String carId) async {
    // نحتفظ باللستة القديمة عشان لو الحذف فشل نرجعها
    if (state is MyCarsLoaded) {
      final currentState = state as MyCarsLoaded;
      final currentCars = List<MyCarModel>.from(currentState.cars);

      // إزالة مؤقتة من الـ UI لسرعة الاستجابة
      final updatedCars = currentCars.where((car) => car.id != carId).toList();
      emit(MyCarsLoaded(updatedCars));

      final result = await repository.deleteCar(carId);

      result.fold(
        (failure) {
          // لو فشل نرجع اللستة القديمة ونعرض خطأ
          emit(MyCarsError(failure.message));
          emit(MyCarsLoaded(currentCars));
        },
        (_) {
          // نجح الحذف خلاص
        },
      );
    }
  }
}
