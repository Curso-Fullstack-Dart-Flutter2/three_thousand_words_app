import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';

abstract class WordsUsecase {
  Future<PaginateWordsResponseEntity> fetchWords();
}
