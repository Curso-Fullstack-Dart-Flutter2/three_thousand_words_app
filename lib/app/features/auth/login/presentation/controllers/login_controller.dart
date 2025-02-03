import 'dart:developer';

import 'package:rxdart/rxdart.dart';
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

  void dispose() {
    _isDisposed = true;
    _loadingController.close();
    _errorController.close();
  }
}
