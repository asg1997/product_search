import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  const AppFonts();

  // Thin / Hair	100
// Extra Light	200
// Light	300
// Regular	400
// Medium	500
// Semi Bold	600
// Bold	700
// Extra Bold	800
// Black / Heavy / Ultra	900

  static final linksButtonSmall = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static final medium12 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final extraBold16 = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static final medium16 = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final medium14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
