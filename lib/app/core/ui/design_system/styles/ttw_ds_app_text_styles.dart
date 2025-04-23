import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class TtwDsAppTextStyles {
  static TextStyle ttwStyleTitle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: TtwDsColors.ttwWhite,
      );

  static TextStyle ttwStyleBody(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16,
        color: TtwDsColors.ttwWhite.withOpacity(0.7),
      );

  static TextStyle ttwStyleButton(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: TtwDsColors.ttwBackground,
      );

  static TextStyle ttwStyleHomeButton(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: TtwDsColors.ttwWhite,
      );
}
