import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        connection.closeConnection();
        break;
      case AppLifecycleState.hidden:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
