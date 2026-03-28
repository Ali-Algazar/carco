import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:carco/features/notifications/presentation/cubit/notifications_state.dart';
import 'notification_item.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationsLoaded) {
          if (state.notifications.isEmpty) {
            return const Center(child: Text('لا توجد إشعارات حالياً'));
          }
          return ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              return NotificationItem(notification: state.notifications[index]);
            },
          );
        } else if (state is NotificationsError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
