import 'package:flutter/material.dart';

class TtwNavigator {
  TtwNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
