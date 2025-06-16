import 'dart:developer' as developer;
import 'dart:math';

import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/repositories/words_repository.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';

class WordsUsecaseImpl implements WordsUsecase {
  final WordsRepository _repository;

  WordsUsecaseImpl({required WordsRepository repository})
      : _repository = repository;

  @override
  Future<PaginateWordsResponseEntity> fetchWords({required int page}) async {
    try {
      final result = await _repository.fetchWords(page: page);

      return result;
    } on Exception catch (error, stacktrace) {
      developer.log('Error: $error');
      developer.log('Stacktrace: $stacktrace');

      throw Exception('Error fetching words');
    }
  }

  @override
  List<String> generateWrongTranslations(
    WordEntity word,
    List<WordEntity> allWords, {
    int count = 3,
  }) {
    final wrongOptions = allWords
        .where((w) => w.traducao != word.traducao)
        .map((w) => w.traducao)
        .toSet()
        .toList()
      ..shuffle();

    return wrongOptions.take(min(count, wrongOptions.length)).toList();
  }
}
