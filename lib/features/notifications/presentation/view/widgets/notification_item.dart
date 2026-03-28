import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/utils/time_ago_extension.dart';
import 'package:carco/features/notifications/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final themeColors = _getThemeColors(notification.type);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : const Color(0xFFFFF9E6),
        border: const Border(
          bottom: BorderSide(color: Color(0xFFE0E1DD), width: 1.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!notification.isRead) ...[
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFD4AF37),
                shape: BoxShape.circle,
              ),
            ),
            12.w,
          ] else ...[
            20.w,
          ],

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppTextStyles.textStyle16Medium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.h,
                Text(
                  notification.message,
                  style: AppTextStyles.textStyle14r.copyWith(
                    color: const Color(0xFF717182),
                  ),
                ),
                8.h,
                Text(
                  notification.time.toArabicTimeAgo(),
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF717182),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          16.w,
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: themeColors['bgColor'],
              shape: BoxShape.circle,
            ),
            child: Icon(
              themeColors['icon'],
              color: themeColors['iconColor'],
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getThemeColors(String type) {
    switch (type) {
      case 'success':
        return {
          'icon': Icons.check_circle_outline,
          'iconColor': const Color(0xFF22C55E),
          'bgColor': const Color(0xFFDCFCE7),
        };
      case 'error':
        return {
          'icon': Icons.cancel_outlined,
          'iconColor': const Color(0xFFE7000B),
          'bgColor': const Color(0xFFFFE2E2),
        };
      case 'warning':
        return {
          'icon': Icons.star_border,
          'iconColor': const Color(0xFFD4AF37),
          'bgColor': const Color(0x14D4AF37),
        };
      case 'message':
        return {
          'icon': Icons.chat_bubble_outline,
          'iconColor': const Color(0xFF3B82F6),
          'bgColor': const Color(0xFFDBEAFE),
        };
      default:
        return {
          'icon': Icons.info_outline,
          'iconColor': const Color(0xFF1A1A1A),
          'bgColor': const Color(0xFFF8F9FA),
        };
    }
  }
}
