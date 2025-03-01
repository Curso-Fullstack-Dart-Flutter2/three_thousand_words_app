import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

abstract class WordsUsecase {
  Future<List<WordEntity>> fetchWords({int limit = 5, int offset = 0});
}
