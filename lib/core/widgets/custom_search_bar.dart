import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.textStyle14r,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        filled: true,
        fillColor: context.theme.brightness == Brightness.light
            ? const Color(0xFFF8F9FA)
            : context.theme.colorScheme.surfaceContainerHighest,

        hintText: hintText ?? 'ابحث عن ماركة، موديل...',
        hintStyle: AppTextStyles.textStyle14r.copyWith(
          color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),

        prefixIcon: Icon(
          Icons.search,
          size: 20,
          color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 1,
          ),
        ),
      ),
    );
  }
}
