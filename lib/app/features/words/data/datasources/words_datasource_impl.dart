import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource.dart';

class WordsDatasourceImpl implements WordsDatasource {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  WordsDatasourceImpl(SqliteConnectionFactory sqliteConnectionFactory)
      : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> saveWords() {
    throw UnimplementedError();
  }
}
