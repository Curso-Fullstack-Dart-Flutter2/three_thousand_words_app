import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';

class WordsController {
  final WordsUsecase _usecase;
  final _wordsController = BehaviorSubject<PaginateWordsResponseEntity?>();

  Stream<PaginateWordsResponseEntity?> get wordsStream =>
      _wordsController.stream;

  WordsController({required WordsUsecase usecase}) : _usecase = usecase;

  Future<void> fetchWords() async {
    try {
      final result = await _usecase.fetchWords();
      _wordsController.add(result);
    } catch (error) {
      log('Error fetching words: $error');
    }
  }

  List<String> generateWrongTranslationsFor(WordEntity word, {int count = 3}) {
    final wordsList = _wordsController.valueOrNull?.data ?? [];

    final wrongOptions = wordsList
        .where((w) => w.traducao != word.traducao)
        .map((w) => w.traducao)
        .toSet()
        .toList()
      ..shuffle();

    return wrongOptions.take(count).toList();
  }
}
