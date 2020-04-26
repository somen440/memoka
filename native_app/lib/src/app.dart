import 'package:clearbook/src/home.dar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const gray = Color(0xFFD8D8D8);
const primaryBackground = Color(0xFF33333D);
const focusColor = Color(0xCCFFFFFF);
const inputBackground = Color(0xFF26282F);

class MemocaApp extends StatelessWidget {
  const MemocaApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memoca',
      debugShowCheckedModeBanner: true,
      theme: _buildMemocaTheme(),
      home: HomePage(),
    );
  }

  ThemeData _buildMemocaTheme() {
    final base = ThemeData.dark();
    return ThemeData(
      scaffoldBackgroundColor: primaryBackground,
      primaryColor: primaryBackground,
      focusColor: focusColor,
      textTheme: _buildMemocaTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: gray,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: inputBackground,
        focusedBorder: InputBorder.none,
      ),
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
