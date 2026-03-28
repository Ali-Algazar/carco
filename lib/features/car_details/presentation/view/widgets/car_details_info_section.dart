import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/car_details/data/models/car_details_model.dart';

class CarDetailsInfoSection extends StatelessWidget {
  const CarDetailsInfoSection({super.key, required this.car});

  final CarDetailsModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  car.name,
                  style: AppTextStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  car.type == 'Sale' ? 'للبيع' : 'للإيجار',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          8.h,
          Text(
            '${car.location} • ${car.year}',
            style: AppTextStyles.textStyle14r.copyWith(
              color: const Color(0xFF717182),
            ),
          ),
          24.h,
          Row(
            children: [
              Expanded(
                child: _buildSpecCard(
                  Icons.settings_outlined,
                  'ناقل الحركة',
                  car.transmission,
                ),
              ),
              16.w,
              Expanded(
                child: _buildSpecCard(
                  Icons.speed_outlined,
                  'الكيلومترات',
                  car.mileage,
                ),
              ),
            ],
          ),
          24.h,
          Text(
            'الوصف',
            style: AppTextStyles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          8.h,
          Text(
            car.description,
            style: AppTextStyles.textStyle14r.copyWith(
              height: 1.6,
              color: const Color(0xFF717182),
            ),
          ),
          24.h,
          Text(
            'معلومات البائع',
            style: AppTextStyles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          16.h,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E1DD)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary.withValues(
                      alpha: 0.1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                16.w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.seller.name,
                        style: AppTextStyles.textStyle16Medium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      4.h,
                      Text(
                        'عضو منذ ${car.seller.joinedDate}',
                        style: AppTextStyles.caption.copyWith(
                          color: const Color(0xFF717182),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFD4AF37), size: 20),
          12.w,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.caption.copyWith(
                  color: const Color(0xFF717182),
                ),
              ),
              Text(
                value,
                style: AppTextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
