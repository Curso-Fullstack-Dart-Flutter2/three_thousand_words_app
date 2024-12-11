import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:three_thousand_words/app/exceptions/auth_exception.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';

class UserDatasourceImpl implements UserDatasource {
  final FirebaseAuth _firebaseAuth;

  const UserDatasourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredencial.user;
    } on FirebaseAuthException catch (error, stacktrace) {
      log('Error to register user on firebase auth',
          error: error, stackTrace: stacktrace);

      if (error.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);

        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'Email já utilizado, por favor escolha outro email');
        } else {
          throw AuthException(
              message:
                  'você se cadastrou com o google, por favor utilize para entrar');
        }
      } else {
        throw AuthException(
            message: error.message ?? 'Erro ao registrar usuário');
      }
    }
  }
}
