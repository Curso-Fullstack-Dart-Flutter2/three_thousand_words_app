import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class ThreeThousandUiConfig {
  ThreeThousandUiConfig._();

  static ThemeData get whiteTheme => ThemeData(
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryColor: const Color(0xFF5C77CE),
        primaryColorLight: const Color(0xFFABC8F7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5C77CE),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: TtwDsColors.ttwBackground,
        cardColor: TtwDsColors.ttwCard,
        primaryColor: TtwDsColors.ttwGreen,
        colorScheme: const ColorScheme.dark(
          surface: TtwDsColors.ttwBackground,
          primary: TtwDsColors.ttwGreen,
          secondary: TtwDsColors.ttwOrange,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
}
