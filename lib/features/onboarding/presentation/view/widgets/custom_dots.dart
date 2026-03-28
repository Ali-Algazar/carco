import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 32 : 12,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.onSurface.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
