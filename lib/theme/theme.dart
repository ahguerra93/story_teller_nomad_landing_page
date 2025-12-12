import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness? brightness) {
  var baseTheme = ThemeData(
      brightness: brightness,
      colorSchemeSeed: Colors.black, // Automa
      useMaterial3: true,
      fontFamily: 'Uniform Rounded');

  return baseTheme;
  // return baseTheme.copyWith(textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme));
}
