import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.5,
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
        ),
        16.w,
        Text(
          S.of(context).or,
          style: AppTextStyles.textStyle14r.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        16.w,
        Expanded(
          child: Container(
            height: 1.5,
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
        ),
      ],
    );
  }
}
