import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/favorites/data/repositories/favorites_repository.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());

  final FavoritesRepository favoritesRepository;

  Future<void> fetchFavorites() async {
    emit(FavoritesLoading());
    var result = await favoritesRepository.getFavorites();
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (favorites) => emit(FavoritesLoaded(favorites)),
    );
  }

  void removeFavorite(int carId) {
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      final updatedList = currentState.favorites
          .where((car) => car.id != carId)
          .toList();
      emit(FavoritesLoaded(updatedList));
    }
  }
}
