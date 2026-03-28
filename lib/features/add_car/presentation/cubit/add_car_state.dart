abstract class AddCarState {}

class AddCarInitial extends AddCarState {}

class AddCarLoading extends AddCarState {}

class AddCarSuccess extends AddCarState {}

class AddCarError extends AddCarState {
  final String message;
  AddCarError(this.message);
}
