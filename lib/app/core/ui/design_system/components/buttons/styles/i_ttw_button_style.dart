import 'package:flutter/material.dart';

abstract class ITtwButtonStyle {
  Color get backgroundColor;
  TextStyle textStyle(BuildContext context);
  EdgeInsets get padding;
  OutlinedBorder get shape;
  bool get isFullWidth;

  /// Override if the style includes icon [IconData],
  /// include text [String]
  /// and BuildContext [context]
  Widget buildChild(String text,
      {IconData? icon, required BuildContext context});
}
