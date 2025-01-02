import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:three_thousand_words/app/features/auth/register/presentation/Controllers/register_controller.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/data/repositories/user_repository_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/repositories/user_repository.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase_impl.dart';
import 'package:three_thousand_words/app/features/splash/presentation/controller/splash_controller.dart';

GetIt getIt = GetIt.instance;

Future<void> appGetItInitial() async {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => SqliteConnectionFactory());

  getIt.registerLazySingleton(() => SplashController());

  getIt.registerLazySingleton<UserDatasource>(
      () => UserDatasourceImpl(firebaseAuth: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDatasource: getIt()));
  getIt.registerLazySingleton<UserUsecase>(
      () => UserUsecaseImpl(userRepository: getIt()));
      
  getIt.registerLazySingleton(() => RegisterController(userUsecase: getIt()));
  getIt.registerLazySingleton(() => LoginController(userUsecase: getIt()));
}
