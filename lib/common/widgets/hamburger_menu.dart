import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({
    super.key,
    required this.darkMode,
    this.homeOptionEnabled = false,
  });

  final bool darkMode;
  final bool homeOptionEnabled;

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    final color = widget.darkMode ? Colors.white : Colors.black;
    final backgroundColor = widget.darkMode ? Colors.black : Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          child: Icon(
            _isOpen ? Icons.close : Icons.menu,
            color: color,
            size: 30,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          height: _isOpen ? 160 : 0,
          width: _isOpen ? 200 : 0,
          margin: EdgeInsets.only(top: 10),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _isOpen ? 1.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(0.3), width: 1),
              ),
              child: Column(
                children: [
                  if (widget.homeOptionEnabled) ...{
                    _MenuItem(
                      text: 'HOME',
                      color: color,
                      onTap: () {
                        // Handle Photography navigation
                        context.go('/');
                      },
                    ),
                    Divider(color: color.withOpacity(0.3), height: 1),
                  },
                  _MenuItem(
                    text: 'PHOTOGRAPHY',
                    color: color,
                    onTap: () {
                      // Handle Photography navigation
                      log('Photography tapped');
                    },
                  ),
                  Divider(color: color.withOpacity(0.3), height: 1),
                  _MenuItem(
                    text: 'VIDEO',
                    color: color,
                    onTap: () {
                      // Handle Video navigation
                      log('Video tapped');
                    },
                  ),
                  Divider(color: color.withOpacity(0.3), height: 1),
                  _MenuItem(
                    text: 'CONTACT',
                    color: color,
                    onTap: () {
                      launchUrl(Uri.parse(
                          'mailto:contact@storytellernomad.com?subject=Contact&body=Hi!+I+would+like+to+get+in+touch+with+you.'));
                      // context.go('/contact');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.text,
    required this.color,
    required this.onTap,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 14,
              letterSpacing: 3.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
