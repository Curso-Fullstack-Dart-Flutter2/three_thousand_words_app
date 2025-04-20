import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TtwDsAppTextStyles {
  static TextStyle ttwStyleTitle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle ttwStyleBody(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
      );

  static TextStyle ttwStyleButton(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
