import 'package:three_thousand_words/app/features/words_local_db/data/datasources/words_local_db_datasource.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/repositories/words_local_db_repository.dart';

class WordsLocalDbRepositoryImpl implements WordsLocalDbRepository {
  final WordsLocalDbDatasource _datasource;

  WordsLocalDbRepositoryImpl({
    required WordsLocalDbDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<void> addWord(String word, String pronunciation, String meaning) {
    final result = _datasource.addWord(word, pronunciation, meaning);
    return result;
  }

  @override
  Future<List<String>> getAllWords() {
    throw UnimplementedError();
  }
}
