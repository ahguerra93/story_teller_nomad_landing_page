import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.desktop,
    this.mobile,
    this.tablet,
    this.wide,
    super.key,
  });

  final Widget desktop;
  final Widget? wide;
  final Widget? tablet;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.wide) {
          return wide ?? desktop;
        } else if (constraints.maxWidth >= Breakpoints.desktop) {
          return desktop;
        } else if (constraints.maxWidth >= Breakpoints.tablet) {
          return tablet ?? desktop;
        } else {
          return mobile ?? tablet ?? desktop;
        }
      },
    );
  }
}
