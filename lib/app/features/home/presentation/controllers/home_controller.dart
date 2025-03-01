import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/usecases/dictionary_usecase.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';

class HomeController {
  final WordsUsecase _wordsUsecase;
  final DictionaryUsecase _dictionaryUsecase;

  final _loadingController = BehaviorSubject<bool>.seeded(false);
  final wordslistController = BehaviorSubject<List<WordEntity>>.seeded([]);

  int _offset = 0;
  final int _limit = 5;

  HomeController({
    required WordsUsecase wordsUsecase,
    required DictionaryUsecase dictionaryUsecase,
  })  : _wordsUsecase = wordsUsecase,
        _dictionaryUsecase = dictionaryUsecase;

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<List<WordEntity>> get wordsStream => wordslistController.stream;

  Future<void> getWords({bool loadMore = false}) async {
    if (loadMore) {
      _offset += _limit;
    } else {
      _offset = 0;
    }

    _loadingController.add(true);

    final result =
        await _wordsUsecase.fetchWords(limit: _limit, offset: _offset);

    if (loadMore) {
      wordslistController.add([...wordslistController.value, ...result]);
    } else {
      wordslistController.add(result);
    }

    _loadingController.add(false);
  }

  Future<DictionaryEntity> searchWord(String word) async {
    _loadingController.add(true);

    final result = await _dictionaryUsecase.getWord(word);
    _loadingController.add(false);
    
    return result;
  }

  void dispose() {
    _loadingController.close();
    wordslistController.close();
  }
}
