import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle lightTextbodyLarge = GoogleFonts.montserrat(
    fontSize: 30,
    color: darkGray,
    fontWeight: FontWeight.w400,
  );
  static TextStyle lightTextbodyMeduim =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: darkGray);
  static TextStyle lightTextbodySmall =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600, color: darkGray);
      
  static TextStyle darkTextbodyLarge = GoogleFonts.montserrat(
    fontSize: 30,
    color: lightGray,
    fontWeight: FontWeight.w400,
  );
  static TextStyle darkTextbodyMeduim =
      GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: lightGray);
  static TextStyle darkTextbodySmall =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600, color: lightGray);
}
