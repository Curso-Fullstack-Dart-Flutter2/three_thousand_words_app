import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/exceptions/auth_exception.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';

class LoginController {
  final UserUsecase _userUsecase;

  final _loadingController = BehaviorSubject<bool>();
  final _errorController = BehaviorSubject<String?>();

  bool _isDisposed = false;

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<String?> get errorStream => _errorController.stream;

  LoginController({required UserUsecase userUsecase})
      : _userUsecase = userUsecase;

  Future<void> login({required String email, required String password}) async {
    if (_isDisposed) return;

    _loadingController.add(true);
    _errorController.add(null);

    try {
      await _userUsecase.login(email, password);
      if (!_isDisposed) _loadingController.add(false);
    } on Exception catch (error, stackTrace) {
      log('Error in controller to login user',
          error: error, stackTrace: stackTrace);

      if (!_isDisposed) _errorController.add(error.toString());
    }
  }

  Future<void> googleLogin() async {
    if (_isDisposed) return;

    _loadingController.add(true);
    _errorController.add(null);

    try {
      await _userUsecase.googleLogin();
      if (!_isDisposed) _loadingController.add(false);
    } on AuthException catch (authError, stackTrace) {
      log('Auth error in controller to login with Google',
          error: authError, stackTrace: stackTrace);

      _userUsecase.googleLogout();

      if (!_isDisposed) _errorController.add(authError.message);
    } on Exception catch (error, stackTrace) {
      log('Error in controller to login with Google',
          error: error, stackTrace: stackTrace);

      _userUsecase.googleLogout();

      if (!_isDisposed) _errorController.add(error.toString());
    } finally {
      _userUsecase.googleLogout();
      if (!_isDisposed) _loadingController.add(false);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _userUsecase.forgotPassword(email);

      log('Email has changed');
    } on Exception catch (error, stackTrace) {
      log('Error in controller to forgot password',
          error: error, stackTrace: stackTrace);
    }
  }

  void dispose() {
    _isDisposed = true;
    _loadingController.close();
    _errorController.close();
  }
}
