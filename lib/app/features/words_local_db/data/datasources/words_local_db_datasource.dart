import 'package:three_thousand_words/app/features/words_local_db/data/models/words_local_db_model.dart';

abstract class WordsLocalDbDatasource {
  Future<void> addWord(String word, String translation, String pronunciation);
  Future<List<WordsLocalDbModel>> getAllWords();
}
