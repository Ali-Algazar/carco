import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/home/data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  final HomeRepository homeRepository;

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    var result = await homeRepository.getHomeData();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (homeData) => emit(HomeLoaded(homeData)),
    );
  }
}
