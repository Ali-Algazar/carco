import 'package:carco/core/cubit/cubit/nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الوصول السريع',
            style: AppTextStyles.textStyle16Medium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          16.h,
          Row(
            children: [
              Expanded(
                child: _buildActionCard(
                  icon: Icons.favorite_outline,
                  title: 'المفضلة',
                  onTap: () {
                    context.read<NavCubit>().changeNavIndex(1);
                  },
                ),
              ),
              16.w,
              Expanded(
                child: _buildActionCard(
                  icon: Icons.receipt_long_outlined,
                  title: 'طلباتي',
                  onTap: () {
                    context.read<NavCubit>().changeNavIndex(3);
                  },
                ),
              ),
              16.w,
              Expanded(
                child: _buildActionCard(
                  icon: Icons.directions_car_outlined,
                  title: 'سياراتي',
                  onTap: () {
                    context.read<NavCubit>().changeNavIndex(3);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE0E1DD), width: 1.5),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0x14D4AF37),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFFD4AF37), size: 24),
            ),
            8.h,
            Text(title, style: AppTextStyles.textStyle14Medium),
          ],
        ),
      ),
    );
  }
}
