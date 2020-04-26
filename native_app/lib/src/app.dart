import 'package:clearbook/src/home.dar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemocaApp extends StatelessWidget {
  const MemocaApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memoca',
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }

  TextTheme _buildMemocaTextTheme(TextTheme base) {
    return base
        .copyWith(
          bodyText2: GoogleFonts.robotoCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText1: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.4,
          ),
          button: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.8,
          ),
          headline5: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        )
        .apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        );
  }
}
