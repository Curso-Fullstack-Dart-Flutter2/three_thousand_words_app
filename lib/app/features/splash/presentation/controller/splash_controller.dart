import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';

class SplashController {
  User? user;

  final isLogged = BehaviorSubject<bool>();
  late StreamSubscription<User?> _authSubscription;

  void initApp() {
    _authSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;
      
      if (!isLogged.isClosed) {
        isLogged.add(user == null);
      }
    });
  }

  void dispose() {
    _authSubscription.cancel();
    isLogged.close();
  }
}
