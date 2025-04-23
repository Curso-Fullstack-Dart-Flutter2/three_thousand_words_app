import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/i_ttw_button_style.dart';

class TtwDsButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  final ITtwButtonStyle style;
  final IconData? icon;

  const TtwDsButton({
    required this.text,
    required this.action,
    required this.style,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: style.backgroundColor,
        textStyle: style.textStyle(context),
        padding: style.padding,
        shape: style.shape,
      ),
      child: style.buildChild(text, icon: icon, context: context),
    );

    if (style.isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
