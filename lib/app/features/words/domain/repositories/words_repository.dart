import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

abstract class WordsRepository {
  Future<List<WordEntity>> fetchWords();
}
