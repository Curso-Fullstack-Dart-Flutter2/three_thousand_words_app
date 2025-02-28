import 'dart:developer';

import 'package:three_thousand_words/app/features/dictionary/data/datasource/dictionary_datasource.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/repositories/dictionary_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryDatasource _datasource;

  DictionaryRepositoryImpl({required DictionaryDatasource datasource})
      : _datasource = datasource;

  @override
  Future<DictionaryEntity> getWord(String word) {
    try {
      final result = _datasource.getWord(word);

      return result;
    } on Exception catch (error, stackTrace) {
      log('Error: $error');
      log('Stack: $stackTrace');

      rethrow;
    }
  }
}
