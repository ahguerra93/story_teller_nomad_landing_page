import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class AltHamburgerMenu extends StatelessWidget {
  const AltHamburgerMenu({super.key, required this.darkMode, this.homeOptionEnabled = false});

  final bool darkMode;
  final bool homeOptionEnabled;

  @override
  Widget build(BuildContext context) {
    final color = darkMode ? Colors.white : Colors.black;
    final backgroundColor = darkMode ? Colors.black : Colors.white;
    final mobile = MediaQuery.of(context).size.width < Breakpoints.tablet;

    // Create menu items
    final List<PopupMenuEntry<String>> menuItems = [];

    if (homeOptionEnabled) {
      menuItems.add(_buildPopupMenuItem('HOME', color));
      menuItems.add(_buildDivider(color));
    }

    menuItems.add(_buildPopupMenuItem('PHOTOGRAPHY', color));
    menuItems.add(_buildDivider(color));
    menuItems.add(_buildPopupMenuItem('VIDEO', color));
    menuItems.add(_buildDivider(color));
    menuItems.add(_buildPopupMenuItem('CONTACT', color));

    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: color, size: mobile ? 30 : 40),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: color.withOpacity(0.3), width: 1),
      ),
      position: PopupMenuPosition.under,
      itemBuilder: (context) => menuItems,
      onSelected: (value) => _handleMenuSelection(context, value),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text, Color color) {
    return PopupMenuItem<String>(
      value: text,
      height: 40,
      child: SizedBox(
        width: 160,
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 14, letterSpacing: 3.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  PopupMenuDivider _buildDivider(Color color) {
    return PopupMenuDivider(height: 1);
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'HOME':
        context.go(AppRoutes.home.path);
        break;
      case 'PHOTOGRAPHY':
        context.go(AppRoutes.photos.path);
        log('Photography tapped');
        break;
      case 'VIDEO':
        context.go(AppRoutes.videos.path);
        log('Video tapped');
        break;
      case 'CONTACT':
        launchUrl(
          Uri.parse(
            'mailto:contact@storytellernomad.com?subject=Contact&body=Hi!+I+would+like+to+get+in+touch+with+you.',
          ),
        );
        break;
    }
  }
}
