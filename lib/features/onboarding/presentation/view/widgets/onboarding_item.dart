import 'package:carco/features/onboarding/presentation/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          model.image,
          height: context.height * 0.4,
          fit: BoxFit.contain,
        ),
        40.h,
        Text(
          model.title,
          style: AppTextStyles.textStyle24.copyWith(
            color: context.theme.colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        16.h,
        Text(
          model.description,
          style: AppTextStyles.textStyle16.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
