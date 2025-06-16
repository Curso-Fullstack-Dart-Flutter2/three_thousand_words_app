import 'dart:developer';

import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/repositories/words_repository.dart';

class WordsRepositoryImpl implements WordsRepository {
  final WordsDatasource _datasource;

  WordsRepositoryImpl({required WordsDatasource datasource})
      : _datasource = datasource;

  @override
  Future<PaginateWordsResponseEntity> fetchWords({required int page}) async {
    try {
      final result = _datasource.fetchWords(page: page);

      return result;
    } on Exception catch (error, stacktrace) {
      log('Error: $error');
      log('Stacktrace: $stacktrace');

      throw Exception('Error fetching words');
    }
  }
}
