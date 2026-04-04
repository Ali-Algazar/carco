import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/home/data/models/car_model.dart';
import 'package:flutter/material.dart';

class AdminCarSpecsGrid extends StatelessWidget {
  final CarModel car;
  const AdminCarSpecsGrid({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        mainAxisSpacing: 10,
      ),
      children: [
        _buildSpecItem(Icons.speed, 'Engine', car.transmission),
        _buildSpecItem(Icons.door_front_door, 'Category', car.carCategory),
        _buildSpecItem(Icons.color_lens, 'Color', car.color),
        _buildSpecItem(Icons.calendar_today, 'Year', car.year),
      ],
    );
  }

  Widget _buildSpecItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF155DFC)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(value, style: AppTextStyles.textStyle14Medium),
          ],
        ),
      ],
    );
  }
}
