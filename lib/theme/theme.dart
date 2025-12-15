import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness? brightness) {
  var baseTheme = ThemeData(
      brightness: brightness,
      colorSchemeSeed: Colors.black, // Automatic primary color generation
      useMaterial3: true,
      fontFamily: 'Uniform Rounded');

  return baseTheme;
  // return baseTheme.copyWith(textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme));
}
