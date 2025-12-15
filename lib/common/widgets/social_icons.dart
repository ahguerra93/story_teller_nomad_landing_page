import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';

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
    return mobile && verticalOnMobile
        ? Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: [
              Icon(FontAwesomeIcons.instagram, color: color, size: size),
              Icon(FontAwesomeIcons.youtube, color: color, size: size),
              Icon(FontAwesomeIcons.tiktok, color: color, size: size),
              Icon(FontAwesomeIcons.xTwitter, color: color, size: size),
            ],
          )
        : Row(
            spacing: spacing,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.instagram, color: color, size: size),
              Icon(FontAwesomeIcons.youtube, color: color, size: size),
              Icon(FontAwesomeIcons.tiktok, color: color, size: size),
              Icon(FontAwesomeIcons.xTwitter, color: color, size: size),
            ],
          );
  }
}
