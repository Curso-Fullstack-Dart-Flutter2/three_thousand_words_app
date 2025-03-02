import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> googleLogin();
  Future<void> googleLogout();
}
