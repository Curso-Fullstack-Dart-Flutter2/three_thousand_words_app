import 'dart:developer';

import 'package:three_thousand_words/app/features/dictionary/data/models/dictionary_model.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/repositories/dictionary_repository.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/usecases/dictionary_usecase.dart';

class DictionaryUsecaseImpl implements DictionaryUsecase {
  final DictionaryRepository _repository;

  DictionaryUsecaseImpl({required DictionaryRepository repository})
      : _repository = repository;

  @override
  Future<DictionaryModel> getWord(String word) {
    try {
      final result = _repository.getWord(word);

      return result;
    } on Exception catch (error, stackTrace) {
      log('Error: $error');
      log('Stack: $stackTrace');

      rethrow;
    }
  }
}
