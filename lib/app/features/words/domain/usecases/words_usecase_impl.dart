import 'dart:developer';

import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/repositories/words_repository.dart';
import 'package:three_thousand_words/app/features/words/domain/usecases/words_usecase.dart';

class WordsUsecaseImpl implements WordsUsecase {
  final WordsRepository _repository;

  WordsUsecaseImpl({required WordsRepository repository})
      : _repository = repository;

  @override
  Future<List<WordEntity>> fetchWords({int limit = 5, int offset = 0}) async {
    try {
      final result = await _repository.fetchWords();

      return result.skip(offset).take(limit).toList();
    } on Exception catch (error, stacktrace) {
      log('Error: $error');
      log('Stacktrace: $stacktrace');

      throw Exception('Error fetching words');
    }
  }
}
