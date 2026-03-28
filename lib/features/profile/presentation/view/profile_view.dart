import 'package:carco/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carco/features/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(sl<ProfileRepository>())..fetchProfileData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'حسابي',
            style: AppTextStyles.textStyle24.copyWith(
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        body: const SafeArea(child: ProfileViewBody()),
      ),
    );
  }
}
