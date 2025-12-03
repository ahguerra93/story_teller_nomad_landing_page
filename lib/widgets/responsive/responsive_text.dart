import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/config/responsiveness/breakpoints.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double? desktopFontSize;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? wideFontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const ResponsiveText(
    this.text, {
    super.key,
    this.desktopFontSize,
    this.mobileFontSize,
    this.tabletFontSize,
    this.wideFontSize,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double? fontSize;

    if (width >= Breakpoints.wide) {
      fontSize = wideFontSize;
    } else if (width >= Breakpoints.desktop) {
      fontSize = desktopFontSize;
    } else if (width >= Breakpoints.tablet) {
      fontSize = tabletFontSize;
    } else {
      fontSize = mobileFontSize;
    }
    return Text(
      text,
      style: (style ?? TextStyle()).copyWith(fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
