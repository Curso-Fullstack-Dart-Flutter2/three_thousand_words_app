import 'dart:developer';

import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/features/dictionary/data/datasource/dictionary_datasource.dart';
import 'package:three_thousand_words/app/features/dictionary/data/models/dictionary_model.dart';

class DictionaryDatasourceImpl implements DictionaryDatasource {
  final HttpCore _httpCore;

  const DictionaryDatasourceImpl({required HttpCore httpCore})
      : _httpCore = httpCore;

  @override
  Future<DictionaryModel> getWord(String word) async {
    try {
      final url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';

      final response = await _httpCore.get(url);
      final result = DictionaryModel.fromJson(response.data[0]);

      return result;
    } on Exception catch (error, stackTrace) {
      log('Error: $error');
      log('Stack: $stackTrace');
      
      rethrow;
    }
  }
}
