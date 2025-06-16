import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

abstract class WordsUsecase {
  Future<PaginateWordsResponseEntity> fetchWords({required int page});

  List<String> generateWrongTranslations(
    WordEntity word,
    List<WordEntity> allWords, {
    int count = 3,
  });
}
