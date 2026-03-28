import 'package:carco/features/auth/data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel profileModel;
  ProfileLoaded(this.profileModel);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
