abstract class EditCarState {}

class EditCarInitial extends EditCarState {}

class EditCarLoading extends EditCarState {}

class EditCarSuccess extends EditCarState {}

class EditCarError extends EditCarState {
  final String message;
  EditCarError(this.message);
}
