import 'dart:developer';

import 'package:rxdart/subjects.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';

class RegisterController {
  final UserUsecase _userUsecase;

  final _loadingController = BehaviorSubject<bool>();
  final _errorController = BehaviorSubject<String?>();

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<String?> get errorStrem => _errorController.stream;

  RegisterController({required UserUsecase userUsecase})
      : _userUsecase = userUsecase;

  Future<void> register(
      {required String email, required String password}) async {
    _loadingController.add(true);
    _errorController.add(null);

    try {
      await _userUsecase.register(email, password);
      _loadingController.add(false);
    } on Exception catch (error, stackTrace) {
      _errorController.add(error.toString());
      log(
        'Error in controller to register user',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void dispose() {
    _loadingController.close();
    _errorController.close();
  }
}
