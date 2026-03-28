import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/notifications/data/repositories/notifications_repository.dart';
import 'package:carco/features/notifications/data/models/notification_model.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepository)
    : super(NotificationsInitial());

  final NotificationsRepository notificationsRepository;

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    var result = await notificationsRepository.getNotifications();
    result.fold(
      (failure) => emit(NotificationsError(failure.message)),
      (notifications) => emit(NotificationsLoaded(notifications)),
    );
  }

  void markAllAsRead() {
    if (state is NotificationsLoaded) {
      final currentState = state as NotificationsLoaded;
      final updatedList = currentState.notifications.map((notif) {
        return NotificationModel(
          id: notif.id,
          type: notif.type,
          title: notif.title,
          message: notif.message,
          time: notif.time,
          isRead: true,
        );
      }).toList();
      emit(NotificationsLoaded(updatedList));
    }
  }
}
