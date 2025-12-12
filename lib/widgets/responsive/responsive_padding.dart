import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    required this.desktopPadding,
    this.child,
    this.mobilePadding,
    this.tabletPadding,
    this.widePadding,
    super.key,
  });
  final EdgeInsets desktopPadding;
  final Widget? child;
  final EdgeInsets? mobilePadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? widePadding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    EdgeInsets? padding;

    if (width >= Breakpoints.wide) {
      padding = widePadding;
    } else if (width >= Breakpoints.desktop) {
      padding = desktopPadding;
    } else if (width >= Breakpoints.tablet) {
      padding = tabletPadding;
    } else {
      padding = mobilePadding;
    }
    return Padding(
      padding: padding ?? desktopPadding,
      child: child,
    );
  }
}
