import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/core/http/http_core_impl.dart';
import 'package:three_thousand_words/app/core/shared_preferences/shared_preferences_core.dart';
import 'package:three_thousand_words/app/core/shared_preferences/shared_preferences_core_impl.dart';
import 'package:three_thousand_words/app/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:three_thousand_words/app/features/auth/register/presentation/Controllers/register_controller.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource.dart';
import 'package:three_thousand_words/app/features/auth/user/data/datasourses/user_datasource_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/data/repositories/user_repository_impl.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/repositories/user_repository.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase.dart';
import 'package:three_thousand_words/app/features/auth/user/domain/usecases/user_usecase_impl.dart';
import 'package:three_thousand_words/app/features/current_page/data/datasources/current_page_sp_datasource.dart';
import 'package:three_thousand_words/app/features/current_page/data/datasources/current_page_sp_datasource_impl.dart';
import 'package:three_thousand_words/app/features/current_page/data/repositories/current_page_sp_repository_impl.dart';
import 'package:three_thousand_words/app/features/current_page/domain/repositories/current_page_sp_repository.dart';
import 'package:three_thousand_words/app/features/current_page/domain/usecases/current_page_sp_usecase.dart';
import 'package:three_thousand_words/app/features/current_page/domain/usecases/current_page_sp_usecase_impl.dart';
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
import 'package:three_thousand_words/app/features/words/presentation/controllers/words_controller.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource_impl.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/repositories/words_local_db_repository_impl.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/repositories/words_local_db_repository.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/usecases/words_local_db_usecase.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/usecases/words_local_db_usecase_impl.dart';
import 'package:three_thousand_words/app/features/words_local_db/presentation/controllers/words_local_db_controller.dart';

GetIt getIt = GetIt.instance;

Future<void> appGetItInitial() async {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<HttpCore>(() => HttpCoreImpl());

  getIt.registerLazySingleton(() => SqliteConnectionFactory());

  getIt.registerLazySingleton<SharedPreferencesCore>(
      () => SharedPreferencesCoreImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton(() => SplashController());

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

  getIt.registerLazySingleton<CurrentPageSpDatasource>(
      () => CurrentPageSpDatasourceImpl(sharedPreferencesCore: getIt()));
  getIt.registerLazySingleton<CurrentPageSpRepository>(
      () => CurrentPageSpRepositoryImpl(currentPageSpDatasource: getIt()));
  getIt.registerLazySingleton<CurrentPageSpUsecase>(
      () => CurrentPageSpUsecaseImpl(currentPageSpRepository: getIt()));

  getIt.registerLazySingleton<WordsDatasource>(
      () => WordsDatasourceImpl(httpCore: getIt()));
  getIt.registerLazySingleton<WordsRepository>(
      () => WordsRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<WordsUsecase>(
      () => WordsUsecaseImpl(repository: getIt()));
  getIt.registerLazySingleton(
      () => WordsController(usecase: getIt(), currentPageSpUsecase: getIt()));

  getIt.registerLazySingleton<WordsLocalDbDatasource>(
      () => WordsLocalDbDatasourceImpl(sqliteConnectionFactory: getIt()));
  getIt.registerLazySingleton<WordsLocalDbRepository>(
      () => WordsLocalDbRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<WordsLocalDbUsecase>(
      () => WordsLocalDbUsecaseImpl(repository: getIt()));
  getIt.registerLazySingleton(() => WordsLocalDbController(usecase: getIt()));
}
