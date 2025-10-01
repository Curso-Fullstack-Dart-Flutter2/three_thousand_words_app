import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/core/navigator/ttw_navigator.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';

class TtwAuthProvider {
  final FirebaseAuth _firebaseAuth;
  final UserUsecase _userUsecase;

  final BehaviorSubject<User?> _userSubject = BehaviorSubject<User?>();

  Stream<User?> get userStream => _userSubject.stream;
  User? get currentUser => _userSubject.valueOrNull;

  TtwAuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserUsecase userUsecase,
  })  : _firebaseAuth = firebaseAuth,
        _userUsecase = userUsecase {
    _init();
  }

  void _init() {
    Rx.merge([
      _firebaseAuth.userChanges(),
      _firebaseAuth.idTokenChanges(),
      _firebaseAuth.authStateChanges(),
    ]).listen((user) {
      _userSubject.add(user);

      if (user != null) {
        TtwNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        TtwNavigator.to.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }

  Future<void> logout() async {
    await _userUsecase.googleLogout();
  }

  void dispose() {
    _userSubject.close();
  }
}
