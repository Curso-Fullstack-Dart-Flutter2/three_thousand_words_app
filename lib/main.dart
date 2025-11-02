import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/three_thousand_words_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();

  await appGetItInitial();

  runApp(const ThreeThousandWordsApp());
}
