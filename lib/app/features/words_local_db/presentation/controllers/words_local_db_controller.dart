import 'package:rxdart/rxdart.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/usecases/words_local_db_usecase.dart';

class WordsLocalDbController {
  final WordsLocalDbUsecase _usecase;

  final _wordAddedSubject = PublishSubject<String>();
  Stream<String> get wordAddedStream => _wordAddedSubject.stream;

  WordsLocalDbController({
    required WordsLocalDbUsecase usecase,
  }) : _usecase = usecase;

  Future<void> verifyAndSaveWord(String word, String pronunciation, String meaning) async {
    await _usecase.addWord(word, pronunciation, meaning);
    _wordAddedSubject.add(word);
  }
}
