import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource.dart';

class WordsLocalDbDatasourceImpl implements WordsLocalDbDatasource {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  WordsLocalDbDatasourceImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> addWord(
      String word, String pronunciation, String meaning) async {
    final connection = await _sqliteConnectionFactory.openConnection();

    await connection.insert('wordsLearned', {
      'id': null,
      'word': word,
      'pronunciation': pronunciation,
      'meaning': meaning,
    });
  }

  @override
  Future<List<String>> getAllWords() {
    throw UnimplementedError();
  }
}
