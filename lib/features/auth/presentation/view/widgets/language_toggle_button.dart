import 'package:carco/core/cubit/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, String>(
      builder: (context, currentLocale) {
        final isArabic = currentLocale == 'ar';

        return InkWell(
          onTap: () {
            context.read<LocaleCubit>().changeLocale(isArabic ? 'en' : 'ar');
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.theme.colorScheme.primary.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language,
                  size: 20,
                  color: context.theme.colorScheme.primary,
                ),
                8.w,
                Text(
                  isArabic ? 'English' : 'العربية',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
