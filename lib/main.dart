import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/three_thousand_words_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  remoteConfig.fetchAndActivate();

  await appGetItInitial();

  runApp(const ThreeThousandWordsApp());
}
