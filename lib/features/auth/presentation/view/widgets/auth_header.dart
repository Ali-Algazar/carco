import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 210,
          height: 100,
          fit: BoxFit.cover,
        ),
        16.h,
        Text(
          title,
          style: AppTextStyles.textStyle24.copyWith(
            color: context.theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        8.h,
        Text(
          subtitle,
          style: AppTextStyles.textStyle16.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
