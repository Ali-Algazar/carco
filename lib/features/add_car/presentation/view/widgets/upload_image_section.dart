import 'dart:io';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class UploadImageSection extends StatelessWidget {
  const UploadImageSection({
    super.key,
    required this.images,
    required this.onPickImages,
    required this.onRemoveImage,
  });

  final List<File> images;
  final VoidCallback onPickImages;
  final Function(int) onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (images.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(images.length, (index) {
              return Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.theme.colorScheme.onSurface.withValues(
                          alpha: 0.1,
                        ),
                      ),
                      image: DecorationImage(
                        image: FileImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: InkWell(
                      onTap: () => onRemoveImage(index),
                      child: Container(
                        padding: 4.all,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.error.withValues(
                            alpha: 0.8,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        if (images.isNotEmpty) 16.h,
        if (images.length < 6)
          InkWell(
            onTap: onPickImages,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.theme.colorScheme.primary.withValues(
                    alpha: 0.5,
                  ),
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 40,
                    color: context.theme.colorScheme.primary,
                  ),
                  8.h,
                  Text(
                    S.of(context).uploadImage,
                    style: AppTextStyles.textStyle16Medium.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  4.h,
                  Text(
                    S.of(context).uploadImageHint,
                    style: AppTextStyles.caption.copyWith(
                      color: context.theme.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
