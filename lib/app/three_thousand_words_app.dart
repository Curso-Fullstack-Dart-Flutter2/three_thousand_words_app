import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/database/sqlite_adm_connection.dart';
import 'package:three_thousand_words/app/modules/auth/login/presentation/pages/login_page.dart';

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

    FirebaseAuth auth = FirebaseAuth.instance;
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Thousand Words app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
    );
  }
}
