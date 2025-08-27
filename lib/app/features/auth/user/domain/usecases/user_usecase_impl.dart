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

  @override
  Future<User?> login(String email, String password) async {
    final result = await _userRepository.login(email, password);

    return result;
  }

  @override
  Future<User?> googleLogin() async {
    final result = await _userRepository.googleLogin();

    return result;
  }

  @override
  Future<void> googleLogout() async {
    final result = await _userRepository.googleLogout();

    return result;
  }

  @override
  Future<void> forgotPassword(String email) {
    final result = _userRepository.forgotPassword(email);

    return result;
  }
}
