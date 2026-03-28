import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp({
  required String phone,
  required String message,
}) async {
  final encodedMessage = Uri.encodeComponent(message);

  final uri = Uri.parse('https://wa.me/$phone?text=$encodedMessage');

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open WhatsApp';
  }
}
