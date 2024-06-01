import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      labelLarge: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: ColorsManager.black
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorsManager.grey
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorsManager.pink
      ),
      bodyMedium: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white
      ),
      bodyLarge: GoogleFonts.montserrat(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white
      ),
    )
  );
  static ThemeData darkTheme = ThemeData();
}