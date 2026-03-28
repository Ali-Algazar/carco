import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/profile/data/repositories/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitial());

  final ProfileRepository profileRepository;

  Future<void> fetchProfileData() async {
    emit(ProfileLoading());
    var result = await profileRepository.getProfileData();
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (profileData) => emit(ProfileLoaded(profileData)),
    );
  }
}
