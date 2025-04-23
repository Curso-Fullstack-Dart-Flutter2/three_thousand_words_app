import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/i_ttw_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';

class TtwChoiceButtonHomeStyle implements ITtwButtonStyle {
  final Color customButtomColor;

  TtwChoiceButtonHomeStyle({required this.customButtomColor});

  @override
  Color get backgroundColor => customButtomColor;

  @override
  TextStyle textStyle(BuildContext context) =>
      TtwDsAppTextStyles.ttwStyleHomeButton(context);

  @override
  EdgeInsets get padding =>
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24);

  @override
  OutlinedBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: customButtomColor),
      );

  @override
  bool get isFullWidth => false;

  @override
  Widget buildChild(String text,
      {IconData? icon, required BuildContext context}) {
    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Icon(icon, color: TtwDsColors.ttwGreen),
    //     const SizedBox(width: 8),
    //     Text(text, style: textStyle(context)),
    //   ],
    // );

    return Text(text, style: textStyle(context));
  }
}
