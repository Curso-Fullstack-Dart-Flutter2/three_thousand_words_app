import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUsecase {
  Future<UserCredential> googleLogin();
  Future<void> googleLogout();
}
