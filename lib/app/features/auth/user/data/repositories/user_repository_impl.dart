import 'package:firebase_auth/firebase_auth.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;

  const UserRepositoryImpl({required UserDatasource userDatasource})
      : _userDatasource = userDatasource;

  @override
  Future<User?> register(String email, String password) async {
    final result = await _userDatasource.register(email, password);

    return result;
  }

  @override
  Future<User?> login(String email, String password) async {
    final result = await _userDatasource.login(email, password);

    return result;
  }

  @override
  Future<User?> googleLogin() async {
    final result = await _userDatasource.googleLogin();

    return result;
  }

  @override
  Future<void> googleLogout() async {
    final result = await _userDatasource.googleLogout();

    return result;
  }

  @override
  Future<void> forgotPassword(String email) {
    final result = _userDatasource.forgotPassword(email);

    return result;
  }
}
