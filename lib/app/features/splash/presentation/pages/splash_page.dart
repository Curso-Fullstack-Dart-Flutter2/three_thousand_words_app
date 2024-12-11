import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/features/splash/presentation/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController controller;

  @override
  void initState() {
    super.initState();

    controller = SplashController();
    controller.initApp();

    Future.delayed(const Duration(seconds: 2), () {
      controller.isLogged.stream.listen((isLogged) {
        if (isLogged) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      });
    });
  }

  @override
  void dispose() {
    controller.isLogged.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Splash page'),
        ],
      ),
    );
  }
}
