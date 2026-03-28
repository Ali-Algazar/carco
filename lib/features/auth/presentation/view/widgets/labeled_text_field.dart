import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/widgets/custom_text_form_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.textStyle14Medium),
        8.h,
        CustomTextFormField(
          validator: validator,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
