import 'package:carco/features/profile/presentation/view/widgets/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:carco/features/profile/presentation/cubit/profile_state.dart';
import 'profile_header_info.dart';
import 'quick_access_section.dart';
import 'settings_list_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeaderInfo(profileModel: state.profileModel),
                24.h,
                const QuickAccessSection(),
                24.h,
                const SettingsListSection(),
                32.h,
                _buildLogoutButton(context),
                32.h,
                Text(
                  'نسخة التطبيق 1.0.0',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF717182),
                  ),
                ),
                32.h,
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => LogoutConfirmationDialog(),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE0E1DD), width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout, color: Color(0xFFE7000B)),
              8.w,
              Text(
                'تسجيل الخروج',
                style: AppTextStyles.textStyle16Medium.copyWith(
                  color: const Color(0xFFE7000B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
