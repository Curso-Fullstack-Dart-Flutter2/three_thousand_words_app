import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/repositories/words_local_db_repository.dart';

class WordsLocalDbRepositoryImpl implements WordsLocalDbRepository {
  final WordsLocalDbDatasource _datasource;

  WordsLocalDbRepositoryImpl({
    required WordsLocalDbDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<void> addWord(String word, String translation, String pronunciation) {
    final result = _datasource.addWord(word, translation, pronunciation);
    return result;
  }

  @override
  Future<List<WordsLocalDbEntity>> getAllWords() {
    final result = _datasource.getAllWords();
    return result;
  }
}
