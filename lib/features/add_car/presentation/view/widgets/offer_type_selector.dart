import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class OfferTypeSelector extends StatefulWidget {
  const OfferTypeSelector({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<OfferTypeSelector> createState() => _OfferTypeSelectorState();
}

class _OfferTypeSelectorState extends State<OfferTypeSelector> {
  String selectedType = 'Sale';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildOption(S.of(context).forSale, 'Sale')),
        16.w,
        Expanded(child: _buildOption(S.of(context).forRent, 'Rent')),
      ],
    );
  }

  Widget _buildOption(String title, String value) {
    final isSelected = selectedType == value;
    return InkWell(
      onTap: () {
        setState(() {
          selectedType = value;
        });
        widget.onChanged(value);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.colorScheme.primary.withValues(alpha: 0.1)
              : context.theme.colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.onSurface.withValues(alpha: 0.2),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.textStyle16Medium.copyWith(
              color: isSelected
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
