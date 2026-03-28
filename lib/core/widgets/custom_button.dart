import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,

    this.isActive = true,
    required this.text,
  });

  final VoidCallback onTap;

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD4AF37), width: 2),
          color: isActive
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.primary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.textStyle16Medium.copyWith(
              color: Color(0xFFD4AF37),
            ),
          ),
        ),
      ),
    );
  }
}
