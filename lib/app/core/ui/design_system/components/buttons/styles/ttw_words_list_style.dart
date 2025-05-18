import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/i_ttw_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class TtwWordsListStyle implements ITtwButtonStyle {
  @override
  Color get backgroundColor => TtwDsColors.ttwGreen;

  @override
  TextStyle textStyle(BuildContext context) =>
      TtwDsAppTextStyles.ttwStyleButton(context);

  @override
  EdgeInsets get padding =>
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24);

  @override
  OutlinedBorder get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  @override
  bool get isFullWidth => true;

  @override
  Widget buildChild(String text,
      {IconData? icon, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: textStyle(context)),
        const Icon(
          FontAwesomeIcons.solidSmile,
          color: TtwDsColors.ttwWhite,
          size: 16,
        ),
      ],
    );
  }
}
