import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness? brightness) {
  var baseTheme = ThemeData(
      brightness: brightness,
      colorSchemeSeed: Colors.black, // Automatic primary color generation
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.black.withOpacity(0.3),
        selectionHandleColor: Colors.black,
      ),
      fontFamily: 'Uniform Rounded');

  return baseTheme;
  // return baseTheme.copyWith(textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme));
}
