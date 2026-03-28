import 'package:flutter/material.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: AppTextStyles.textStyle14Medium,
        children: [
          TextSpan(
            text: ' *',
            style: AppTextStyles.textStyle14Medium.copyWith(
              color: const Color(0xFFC1121F),
            ),
          ),
        ],
      ),
    );
  }
}
