import 'package:firebase_auth/firebase_auth.dart';
import 'package:three_thousand_words/app/modules/auth/login/data/datasource/login_datasource.dart';
import 'package:three_thousand_words/app/modules/auth/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepositoryImpl({required LoginDatasource loginDatasource})
      : _loginDatasource = loginDatasource;

  @override
  Future<UserCredential> googleLogin() {
    final result = _loginDatasource.googleLogin();
    return result;
  }

  @override
  Future<void> googleLogout() {
    final result = _loginDatasource.googleLogout();
    return result;
  }
}
