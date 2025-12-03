import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(Brightness? brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    colorSchemeSeed: Colors.blueGrey, // Automa
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
  );
}
