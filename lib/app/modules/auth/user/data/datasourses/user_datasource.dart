import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDatasource {
  Future<User?> register(String email, String password);
}
