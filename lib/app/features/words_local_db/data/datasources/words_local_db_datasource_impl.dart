import 'dart:developer';

import 'package:three_thousand_words/app/core/database/sqlite_connection_factory.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource.dart';
import 'package:three_thousand_words/app/features/words_local_db/data/models/words_local_db_model.dart';

class WordsLocalDbDatasourceImpl implements WordsLocalDbDatasource {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  WordsLocalDbDatasourceImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> addWord(
      String word, String translation, String pronunciation) async {
    try {
      final connection = await _sqliteConnectionFactory.openConnection();

      log('Adding word in db: $word, translation: $translation, pronunciation: $pronunciation');

      await connection.insert('wordsLearned', {
        'id': null,
        'word': word,
        'pronunciation': pronunciation,
        'meaning': translation,
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Future<List<WordsLocalDbModel>> getAllWords() async {
    final connection = await _sqliteConnectionFactory.openConnection();

    final result = await connection.rawQuery('SELECT * FROM wordsLearned');

    return result.map((json) {
      return WordsLocalDbModel.fromJson(json);
    }).toList();
  }
}
