import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeadLineText extends StatelessWidget {
  const CustomHeadLineText({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: GoogleFonts.montserrat.toString(), fontSize: 20),
    );
  }
}
