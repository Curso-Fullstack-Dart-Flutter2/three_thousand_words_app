import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/core/http/http_core_impl.dart';
import 'package:three_thousand_words/app/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:three_thousand_words/app/features/auth/register/presentation/Controllers/register_controller.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/data/repositories/user_repository_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/repositories/user_repository.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase_impl.dart';
import 'package:three_thousand_words/app/features/dictionary/data/datasource/dictionary_datasource.dart';
import 'package:three_thousand_words/app/features/dictionary/data/datasource/dictionary_datasource_impl.dart';
import 'package:three_thousand_words/app/features/dictionary/data/repositories/dictionary_repository_impl.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/repositories/dictionary_repository.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/usecases/dictionary_usecase.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/usecases/dictionary_usecase_impl.dart';
import 'package:three_thousand_words/app/features/splash/presentation/controller/splash_controller.dart';
import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource.dart';
import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource_impl.dart';
import 'package:three_thousand_words/app/features/words/data/repositories/words_repository_impl.dart';
import 'package:three_thousand_words/app/features/words/domain/repositories/words_repository.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase_impl.dart';

GetIt getIt = GetIt.instance;

Future<void> appGetItInitial() async {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => SqliteConnectionFactory());

  getIt.registerLazySingleton(() => SplashController());

  getIt.registerLazySingleton<HttpCore>(() => HttpCoreImpl());

  getIt.registerLazySingleton<UserDatasource>(
      () => UserDatasourceImpl(firebaseAuth: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDatasource: getIt()));
  getIt.registerLazySingleton<UserUsecase>(
      () => UserUsecaseImpl(userRepository: getIt()));

  getIt.registerLazySingleton(() => RegisterController(userUsecase: getIt()));
  getIt.registerLazySingleton(() => LoginController(userUsecase: getIt()));

  getIt.registerLazySingleton<DictionaryDatasource>(
      () => DictionaryDatasourceImpl(httpCore: getIt()));
  getIt.registerLazySingleton<DictionaryRepository>(
      () => DictionaryRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<DictionaryUsecase>(
      () => DictionaryUsecaseImpl(repository: getIt()));

  getIt.registerLazySingleton<WordsDatasource>(() => WordsDatasourceImpl());
  getIt.registerLazySingleton<WordsRepository>(
      () => WordsRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<WordsUsecase>(
      () => WordsUsecaseImpl(repository: getIt()));
}
