import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.maxLength,
    this.errorText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final int? maxLength;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,

      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
      keyboardType: keyboardType,
      style: AppTextStyles.textStyle16,
      decoration: InputDecoration(
        prefixIconColor: context.theme.colorScheme.onSurface.withValues(
          alpha: 0.5,
        ),
        contentPadding: 16.all,
        errorText: errorText,
        hintText: hintText,
        hintStyle: AppTextStyles.textStyle16.copyWith(
          color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: "",

        border: _buildBorder(context.theme.colorScheme.primary),
        enabledBorder: _buildBorder(context.theme.colorScheme.primary),
        focusedBorder: _buildBorder(
          context.theme.colorScheme.primary,
          width: 2.0,
        ),
        errorBorder: _buildBorder(context.theme.colorScheme.error),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color, {double width = 1.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
