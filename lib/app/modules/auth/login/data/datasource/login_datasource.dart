import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDatasource {
  Future<UserCredential> googleLogin();
  Future<void> googleLogout();
}
