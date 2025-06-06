import 'package:firebase_auth/firebase_auth.dart';

abstract class UserUsecase {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<User?> googleLogin();
  Future<void> forgotPassword(String email);
}
