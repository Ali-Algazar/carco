import 'package:carco/core/helper_functions/open_whats_app.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailsBottomBar extends StatelessWidget {
  const CarDetailsBottomBar({
    super.key,
    required this.price,
    required this.type,
  });

  final num price;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السعر',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF717182),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      price.toString(),
                      style: AppTextStyles.textStyle24.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    4.w,
                    Text(
                      type == 'Rent' ? 'جنيه/يوم' : 'جنيه',
                      style: AppTextStyles.textStyle14Medium.copyWith(
                        color: const Color(0xFF717182),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _buildActionButton(
                  context,
                  Icons.chat_bubble_outline,
                  'محادثة',
                  false,
                  () {
                    openWhatsApp(
                      phone: '201090786986',
                      message:
                          'مرحبًا، أنا مهتم بسيارتك المعروضة في تطبيق Carco وأود معرفة المزيد من التفاصيل.',
                    );
                  },
                ),
                12.w,
                _buildActionButton(context, Icons.call, 'اتصال', true, () {
                  makePhoneCall('01090786986');
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');

    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch $phoneUri');
    }
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String text,
    bool isPrimary,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPrimary
                ? context.theme.colorScheme.primary
                : const Color(0xFFE0E1DD),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 15,
              color: isPrimary
                  ? Colors.white
                  : context.theme.colorScheme.primary,
            ),
            Text(
              text,
              style: AppTextStyles.textStyle14Medium.copyWith(
                color: isPrimary
                    ? Colors.white
                    : context.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
