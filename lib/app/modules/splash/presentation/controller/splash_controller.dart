import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';

class SplashController {
  User? user;
  final isLogged = BehaviorSubject<bool>();

  void initApp() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;

      if (user == null) {
        isLogged.value = false;
      } else {
        isLogged.value = true;
      }
    });
  }
}
