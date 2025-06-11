import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/repositories/words_local_db_repository.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/usecases/words_local_db_usecase.dart';

class WordsLocalDbUsecaseImpl implements WordsLocalDbUsecase {
  final WordsLocalDbRepository _repository;

  WordsLocalDbUsecaseImpl({
    required WordsLocalDbRepository repository,
  }) : _repository = repository;

  @override
  Future<void> addWord(String word, String translation, String pronunciation) {
    final result = _repository.addWord(word, translation, pronunciation);
    return result;
  }

  @override
  Future<List<WordsLocalDbEntity>> getAllWords() {
    final result = _repository.getAllWords();
    return result;
  }
}
