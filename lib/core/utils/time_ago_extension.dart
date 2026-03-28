extension TimeAgoExtension on DateTime {
  String toArabicTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 10) return 'منذ ${difference.inDays} يوماً';
    if (difference.inDays > 2) return 'منذ ${difference.inDays} أيام';
    if (difference.inDays == 2) return 'منذ يومين';
    if (difference.inDays == 1) return 'منذ يوم';

    if (difference.inHours > 10) return 'منذ ${difference.inHours} ساعة';
    if (difference.inHours > 2) return 'منذ ${difference.inHours} ساعات';
    if (difference.inHours == 2) return 'منذ ساعتين';
    if (difference.inHours == 1) return 'منذ ساعة';

    if (difference.inMinutes > 10) return 'منذ ${difference.inMinutes} دقيقة';
    if (difference.inMinutes > 2) return 'منذ ${difference.inMinutes} دقائق';
    if (difference.inMinutes == 2) return 'منذ دقيقتين';
    if (difference.inMinutes == 1) return 'منذ دقيقة';

    return 'الآن';
  }
}
