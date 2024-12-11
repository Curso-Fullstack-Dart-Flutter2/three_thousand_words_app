import 'package:firebase_auth/firebase_auth.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/repositories/user_repository.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';

class UserUsecaseImpl implements UserUsecase {
  final UserRepository _userRepository;

  const UserUsecaseImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) async {
    final result = await _userRepository.register(email, password);

    return result;
  }
}
