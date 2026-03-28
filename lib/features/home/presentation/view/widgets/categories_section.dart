import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryChanged,
  });

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تصفح حسب النوع',
          style: AppTextStyles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        16.h,
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return InkWell(
                onTap: () => onCategoryChanged(index),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.theme.colorScheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? context.theme.colorScheme.primary
                          : const Color(0xFFE0E1DD),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index],
                    style: AppTextStyles.textStyle14Medium.copyWith(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
