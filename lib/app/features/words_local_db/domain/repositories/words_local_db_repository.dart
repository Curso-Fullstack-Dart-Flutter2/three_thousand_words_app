import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';

abstract class WordsLocalDbRepository {
  Future<void> addWord(String word, String translation, String pronunciation);
  Future<List<WordsLocalDbEntity>> getAllWords();
}
