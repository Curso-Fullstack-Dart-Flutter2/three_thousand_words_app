import 'dart:developer';

import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource.dart';
import 'package:three_thousand_words/app/features/words/data/models/paginate_words_response_model.dart';

class WordsDatasourceImpl implements WordsDatasource {
  final HttpCore _httpCore;

  WordsDatasourceImpl({required HttpCore httpCore}) : _httpCore = httpCore;

  @override
  Future<PaginateWordsResponseModel> fetchWords(
      {required int page, int limit = 5}) async {
    const baseUrl =
        'https://three-thousand-word-pkxgkddqr-filipes-projects-54e64146.vercel.app';

    try {
      log('Fetching words from page: $page with limit: $limit');

      final result = await _httpCore.get(
        '$baseUrl/words-info?page=$page&limit=$limit',
      );

      final data = result.data;

      return PaginateWordsResponseModel.fromJson(data);
    } on Exception catch (error, stackTrace) {
      log('Error fetching words: $error');
      log('Stack trace: $stackTrace');

      rethrow;
    } catch (error) {
      log('Unexpected error: $error');
      rethrow;
    }
  }
}
