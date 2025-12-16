import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({required this.darkMode, this.verticalOnMobile = true, super.key});
  final bool darkMode;
  final bool verticalOnMobile;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < Breakpoints.tablet;
    final size = mobile ? 16.0 : 24.0;
    final spacing = mobile ? 10.0 : 16.0;
    final color = darkMode ? Colors.white : Colors.black;
    const instagramUrl = 'https://www.instagram.com/storytellernomad';
    const facebookUrl = 'https://www.facebook.com/storytellernomads';
    const tiktokUrl = 'https://www.tiktok.com/@storytellernomad';
    // const twitterUrl = 'https://twitter.com';
    const instagramIcon = FontAwesomeIcons.instagram;
    const facebookIcon = FontAwesomeIcons.facebook;
    const tiktokIcon = FontAwesomeIcons.tiktok;
    // const twitterIcon = FontAwesomeIcons.xTwitter;
    return mobile && verticalOnMobile
        ? Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: [
              _Icon(iconData: instagramIcon, url: instagramUrl, color: color, size: size),
              _Icon(iconData: facebookIcon, url: facebookUrl, color: color, size: size),
              _Icon(iconData: tiktokIcon, url: tiktokUrl, color: color, size: size),
              // _Icon(iconData: twitterIcon, url: twitterUrl, color: color, size: size),
            ],
          )
        : Row(
            spacing: spacing,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Icon(iconData: instagramIcon, url: instagramUrl, color: color, size: size),
              _Icon(iconData: facebookIcon, url: facebookUrl, color: color, size: size),
              _Icon(iconData: tiktokIcon, url: tiktokUrl, color: color, size: size),
              // _Icon(iconData: twitterIcon, url: twitterUrl, color: color, size: size),
            ],
          );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.iconData,
    required this.url,
    required this.color,
    required this.size,
  });
  final IconData iconData;
  final String url;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        } else {
          log('Could not launch $url');
        }
      },
      child: Icon(
        iconData,
        color: color,
        size: size,
      ),
    );
  }
}
