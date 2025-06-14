import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/usecases/words_local_db_usecase.dart';

class WordsLocalDbController {
  final WordsLocalDbUsecase _usecase;

  final _wordAddedSubject = PublishSubject<String>();
  Stream<String> get wordAddedStream => _wordAddedSubject.stream;

  final _allWordsSubject = BehaviorSubject<List<WordsLocalDbEntity>>();
  Stream<List<WordsLocalDbEntity>> get allWordsStream =>
      _allWordsSubject.stream;

  WordsLocalDbController({
    required WordsLocalDbUsecase usecase,
  }) : _usecase = usecase;

  Future<void> saveWord(
      String word, String translation, String pronunciation) async {
    await _usecase.addWord(word, translation, pronunciation);
    _wordAddedSubject.add(word);
  }

  Future<void> fetchSavedWords() async {
    final result = await _usecase.getAllWords();
    _allWordsSubject.add(result);
  }

  bool isAnswerCorrect({
    required String selected,
    required String correctTranslation,
  }) {
    return selected == correctTranslation;
  }

  void dispose() {
    _wordAddedSubject.close();
  }
}
