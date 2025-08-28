import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/remote_config/remote_config_service.dart';
import 'package:three_thousand_words/app/exceptions/auth_exception.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';

class UserDatasourceImpl implements UserDatasource {
  final FirebaseAuth _firebaseAuth;

  const UserDatasourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseAuth.signOut();

      return userCredential.user;
    } on FirebaseAuthException catch (error, stackTrace) {
      log(
        'Error to register user on Firebase Auth',
        error: error,
        stackTrace: stackTrace,
      );

      if (error.code == 'email-already-in-use') {
        try {
          throw AuthException(
            message: 'Email já utilizado, por favor escolha outro email',
          );
        } on FirebaseAuthException catch (authError) {
          if (authError.code == 'wrong-password') {
            throw AuthException(
              message: 'Você se cadastrou com outro método, use-o para entrar',
            );
          } else {
            throw AuthException(
              message: authError.message ?? 'Erro ao verificar método de login',
            );
          }
        }
      } else {
        throw AuthException(
          message: error.message ?? 'Erro ao registrar usuário',
        );
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on PlatformException catch (error, stackTrace) {
      log('Error to login user on Firebase Auth',
          error: error, stackTrace: stackTrace);

      throw AuthException(message: error.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (error, stackTrace) {
      log('Error to login user on Firebase Auth',
          error: error, stackTrace: stackTrace);

      if (error.code == 'user-not-found') {
        throw AuthException(
          message: 'Usuário não encontrado, por favor cadastre-se',
        );
      } else if (error.code == 'wrong-password') {
        throw AuthException(
          message: 'Senha incorreta, por favor tente novamente',
        );
      } else {
        throw AuthException(
          message: error.message ?? 'Erro ao realizar login',
        );
      }
    }
  }

  @override
  Future<User?> googleLogin() async {
    try {
      final clientId = getIt<RemoteConfigService>().googleClientId;

      final googleSignIN = GoogleSignIn(
        serverClientId: clientId,
        scopes: ['email', 'profile'],
      );

      final googleSignInAccount = await googleSignIN.signIn();

      if (googleSignInAccount != null) {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final userCredential =
            await _firebaseAuth.signInWithCredential(googleCredential);

        return userCredential.user;
      } else {
        throw AuthException(message: 'Erro ao realizar login com o google');
      }
    } on Exception catch (error, stackTrace) {
      log('Error to login user with google',
          error: error, stackTrace: stackTrace);

      throw AuthException(message: 'Erro ao realizar login com o google');
    }
  }

  @override
  Future<void> googleLogout() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else {
        throw AuthException(
          message:
              'Cadastro realizado com o google, por favor entre com o google',
        );
      }
    } on PlatformException catch (error, stackTrace) {
      log('Error to send reset password email',
          error: error, stackTrace: stackTrace);
    }
  }
}
