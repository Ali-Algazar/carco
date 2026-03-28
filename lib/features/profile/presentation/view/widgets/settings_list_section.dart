import 'package:carco/core/helper_functions/open_whats_app.dart';
import 'package:carco/features/notifications/presentation/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class SettingsListSection extends StatelessWidget {
  const SettingsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الإعدادات',
            style: AppTextStyles.textStyle16Medium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          16.h,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE0E1DD), width: 1.5),
            ),
            child: Column(
              children: [
                _buildListTile(
                  icon: Icons.notifications_outlined,
                  title: 'الإشعارات',
                  onTap: () {
                    Navigator.pushNamed(context, NotificationsView.routeName);
                  },
                ),
                const Divider(height: 1, color: Color(0xFFE0E1DD)),
                _buildListTile(
                  icon: Icons.settings_outlined,
                  title: 'الإعدادات',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Color(0xFFE0E1DD)),
                _buildListTile(
                  icon: Icons.security_outlined,
                  title: 'الخصوصية والأمان',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Color(0xFFE0E1DD)),
                _buildListTile(
                  icon: Icons.help_outline,
                  title: 'المساعدة والدعم',
                  onTap: () {
                    openWhatsApp(
                      phone: '201090786986',
                      message: 'مرحبًا، أحتاج إلى مساعدة بخصوص تطبيق Carco.',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: const Color(0xFF1A1A1A)),
      title: Text(title, style: AppTextStyles.textStyle16),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
        color: Color(0xFF717182),
      ),
    );
  }
}
