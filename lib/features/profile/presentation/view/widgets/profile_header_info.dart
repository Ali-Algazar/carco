import 'package:carco/core/utils/app_colors.dart';
import 'package:carco/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class ProfileHeaderInfo extends StatelessWidget {
  const ProfileHeaderInfo({super.key, required this.profileModel});

  final UserModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileModel.fullName,
                    style: AppTextStyles.textStyle20.copyWith(
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  4.h,
                  Text(
                    profileModel.email,
                    style: AppTextStyles.textStyle14r.copyWith(
                      color: const Color(0xFF717182),
                    ),
                  ),
                  8.h,
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'تعديل الملف الشخصي',
                          style: AppTextStyles.textStyle14Medium.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                        4.w,
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12,
                          color: context.theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          24.h,
          const Divider(color: Color(0xFFE0E1DD), height: 1),
          16.h,
          Row(
            children: [
              _buildStatItem('طلباتي', '30'),
              _buildDivider(),
              _buildStatItem('المفضلة', '12'),
              _buildDivider(),
              _buildStatItem('إعلاناتي', '5'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.textStyle20.copyWith(
              color: AppColors.primaryLight,
            ),
          ),
          4.h,
          Text(
            title,
            style: AppTextStyles.textStyle14r.copyWith(
              color: const Color(0xFF717182),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 40, width: 1, color: const Color(0xFFE0E1DD));
  }
}
