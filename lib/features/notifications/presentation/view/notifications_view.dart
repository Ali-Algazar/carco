import 'package:carco/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:carco/features/notifications/presentation/view/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  static const String routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationsCubit(sl<NotificationsRepository>())
            ..fetchNotifications(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'الإشعارات',
            style: AppTextStyles.textStyle20.copyWith(
              color: const Color(0xFF1A1A1A),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF1A1A1A),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    context.read<NotificationsCubit>().markAllAsRead();
                  },
                  child: Text(
                    'تحديد الكل كمقروء',
                    style: AppTextStyles.textStyle14Medium.copyWith(
                      color: const Color(0xFFD4AF37),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: const SafeArea(child: NotificationsViewBody()),
      ),
    );
  }
}
