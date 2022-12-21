import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inditab_test/views/constants/colors/colors.dart';

class KFonts {
  static final splashTextStyle = TextStyle(
    fontFamily: 'Schyler',
    fontWeight: FontWeight.bold,
    fontSize: 44,
    color: kPurple,
  );

  static final TextStyle appbartextStyle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle buttonTextGstyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static final TextStyle bodySmallTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle inputLabelStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.deepPurple,
  );
}
