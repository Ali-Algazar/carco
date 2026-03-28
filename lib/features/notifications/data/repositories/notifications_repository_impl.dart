import 'package:dartz/dartz.dart';
import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/notifications/data/datasources/notifications_remote_data_source.dart';
import 'package:carco/features/notifications/data/models/notification_model.dart';
import 'package:carco/features/notifications/data/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;

  NotificationsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    try {
      final notifications = await remoteDataSource.getNotifications();
      return Right(notifications);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
