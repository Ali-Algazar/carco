import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
}
