import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/features/current_page/domain/usecases/current_page_sp_usecase.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';

class WordsController {
  final WordsUsecase _usecase;
  final CurrentPageSpUsecase _currentPageSpUsecase;

  final _wordsController = BehaviorSubject<PaginateWordsResponseEntity?>();
  final _lastPageController = BehaviorSubject<int>();

  Stream<PaginateWordsResponseEntity?> get wordsStream =>
      _wordsController.stream;

  Stream<int> get lastPageStream => _lastPageController.stream;

  int? get lastPageValue => _lastPageController.valueOrNull;

  WordsController({
    required WordsUsecase usecase,
    required CurrentPageSpUsecase currentPageSpUsecase,
  })  : _usecase = usecase,
        _currentPageSpUsecase = currentPageSpUsecase;

  Future<void> fetchWords({required int page}) async {
    try {
      final result = await _usecase.fetchWords(page: page);
      _wordsController.add(result);
    } catch (error) {
      log('Error fetching words: $error');
    }
  }

  Future<int> fetchLastPage() async {
    try {
      final lastPage = await _currentPageSpUsecase.getCurrentPage();
      _lastPageController.add(lastPage);

      return lastPage;
    } catch (error) {
      log('Error fetching last page: $error');
      rethrow;
    }
  }

  Future<void> toSendLastPage(int page) async {
    try {
      await _currentPageSpUsecase.saveCurrentPage(page);
      _lastPageController.add(page);
    } catch (error) {
      log('Error saving last page: $error');
    }
  }

  List<String> generateWrongTranslationsFor(WordEntity word) {
    final wordsList = _wordsController.valueOrNull?.data ?? [];

    return _usecase.generateWrongTranslations(word, wordsList);
  }
}
