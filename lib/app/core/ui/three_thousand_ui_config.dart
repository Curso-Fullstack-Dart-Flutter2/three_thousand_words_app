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
        primaryColor: TtwDsColors.ttwWhite,
        colorScheme: const ColorScheme.dark(
          surface: TtwDsColors.ttwBackground,
          primary: TtwDsColors.ttwWhite,
          secondary: TtwDsColors.ttwOrange,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: TtwDsColors.ttwWhite,
          selectionColor: TtwDsColors.ttwWhite,
          selectionHandleColor: TtwDsColors.ttwWhite,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: TtwDsColors.ttwInputTextBlack,
          labelStyle: const TextStyle(color: TtwDsColors.ttwWhite),
          hintStyle: const TextStyle(color: TtwDsColors.ttwWhite),
          focusColor: TtwDsColors.ttwWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: TtwDsColors.ttwInputTextBlack),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: TtwDsColors.ttwInputTextBlack),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
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
