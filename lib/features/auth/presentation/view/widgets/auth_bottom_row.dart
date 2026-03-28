import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class AuthBottomRow extends StatelessWidget {
  const AuthBottomRow({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });

  final String question;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppTextStyles.textStyle14r.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        4.w,
        InkWell(
          onTap: onTap,
          child: Text(
            action,
            style: AppTextStyles.textStyle14Bold.copyWith(
              color: context.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
