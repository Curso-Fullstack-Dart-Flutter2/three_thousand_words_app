import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/database/sqlite_adm_connection.dart';
import 'package:three_thousand_words/app/core/ui/three_thousand_ui_config.dart';
import 'package:three_thousand_words/app/features/auth/login/presentation/pages/login_page.dart';
import 'package:three_thousand_words/app/features/auth/register/presentation/pages/register_page.dart';
import 'package:three_thousand_words/app/features/home/presentation/pages/home_page.dart';
import 'package:three_thousand_words/app/features/splash/presentation/pages/splash_page.dart';

class ThreeThousandWordsApp extends StatefulWidget {
  const ThreeThousandWordsApp({super.key});

  @override
  State<ThreeThousandWordsApp> createState() => _ThreeThousandWordsAppState();
}

class _ThreeThousandWordsAppState extends State<ThreeThousandWordsApp> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Thousand Words app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      theme: ThreeThousandUiConfig.theme,
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
