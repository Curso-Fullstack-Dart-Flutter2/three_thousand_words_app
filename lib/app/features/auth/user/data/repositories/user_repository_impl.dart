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
}
