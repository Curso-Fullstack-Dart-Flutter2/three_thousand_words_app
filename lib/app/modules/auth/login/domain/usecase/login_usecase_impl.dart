import 'package:firebase_auth/firebase_auth.dart';
import 'package:three_thousand_words/app/modules/auth/login/domain/repository/login_repository.dart';
import 'package:three_thousand_words/app/modules/auth/login/domain/usecase/login_usecase.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecaseImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<UserCredential> googleLogin() {
    final result = _loginRepository.googleLogin();
    return result;
  }

  @override
  Future<void> googleLogout() {
    final result = _loginRepository.googleLogout();
    return result;
  }
}
