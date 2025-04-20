import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class TtwDsPrimaryButtom extends StatelessWidget {
  final String text;
  final VoidCallback action;

  const TtwDsPrimaryButtom({
    required this.text,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: TtwDsColors.ttwGreen,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: TtwDsAppTextStyles.ttwStyleButton(context),
      ),
    );
  }
}
