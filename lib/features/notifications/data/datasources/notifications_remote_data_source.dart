import 'package:carco/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class MockNotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();

    final List<Map<String, dynamic>> mockJson = [
      {
        "id": 1,
        "type": "success",
        "title": "تم قبول إعلانك",
        "message": "تم الموافقة على إعلان مرسيدس S-Class 2024 ونشره بنجاح",
        "time": now.subtract(const Duration(hours: 1)).toIso8601String(),
        "read": false,
      },
      {
        "id": 2,
        "type": "success",
        "title": "تم قبول طلبك",
        "message": "تم قبول طلب شراء بي إم دبليو M4 Competition",
        "time": now.subtract(const Duration(hours: 3)).toIso8601String(),
        "read": false,
      },
      {
        "id": 3,
        "type": "warning",
        "title": "إعلانك مميز الآن",
        "message": "تم ترقية إعلانك إلى الإعلانات المميزة",
        "time": now.subtract(const Duration(hours: 5)).toIso8601String(),
        "read": true,
      },
      {
        "id": 4,
        "type": "error",
        "title": "تم رفض إعلانك",
        "message": "تم رفض إعلان أودي Q7 2024. السبب: الصور غير واضحة",
        "time": now.subtract(const Duration(days: 1)).toIso8601String(),
        "read": true,
      },
      {
        "id": 5,
        "type": "message",
        "title": "رسالة جديدة",
        "message": "أرسل لك أحمد محمد رسالة بخصوص سيارتك",
        "time": now.subtract(const Duration(days: 2)).toIso8601String(),
        "read": true,
      },
      {
        "id": 6,
        "type": "error",
        "title": "تم رفض طلبك",
        "message": "تم رفض طلب إيجار رينج روفر Sport 2023",
        "time": now.subtract(const Duration(days: 3)).toIso8601String(),
        "read": true,
      },
    ];

    return mockJson.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
