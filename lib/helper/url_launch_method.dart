import 'package:url_launcher/url_launcher.dart';

Future<void> launchurl({required String address}) async {
  final Uri url = Uri.parse(address);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
