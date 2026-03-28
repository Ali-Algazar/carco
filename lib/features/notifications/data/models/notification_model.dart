class NotificationModel {
  final int id;
  final String type;
  final String title;
  final String message;
  final DateTime time;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? 'info',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      time: DateTime.parse(json['time']),
      isRead: json['read'] ?? false,
    );
  }
}
