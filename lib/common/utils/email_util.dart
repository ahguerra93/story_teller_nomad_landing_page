import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class EmailUtil {
  static const String _email = 'contact@storytellernomad.com';
  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Uri getEmailUri({String subject = '', String body = ''}) {
    return Uri(
      scheme: 'mailto',
      path: _email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Contact - Storyteller Nomad',
        'body': 'Hello! I would like to get in touch with you.'
      }),
    );
  }

  static void launchEmailClient() async {
    final Uri emailLaunchUri = getEmailUri();
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri, mode: LaunchMode.platformDefault);
    } else {
      // Fallback: copy email to clipboard or show error
      log('Could not launch email client');
    }
  }
}
