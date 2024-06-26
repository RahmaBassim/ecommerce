import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorsManager.softGrey,
      useMaterial3: false,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: ColorsManager.black
      ),
      displayMedium:  GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ColorsManager.black
      ),
      displaySmall:  GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
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
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: ColorsManager.white
      ),
      displayMedium:  GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white
      ),
      displaySmall:  GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white
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
          color: ColorsManager.black
      ),
      bodyLarge: GoogleFonts.montserrat(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: ColorsManager.black
      ),
    )
  );
}