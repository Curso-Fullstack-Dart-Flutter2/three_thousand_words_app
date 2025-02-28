import 'package:three_thousand_words/app/core/http/http_core.dart';
import 'package:three_thousand_words/app/features/dictionary/data/datasource/dictionary_datasource.dart';
import 'package:three_thousand_words/app/features/dictionary/data/models/dictionary_model.dart';

class DictionaryDatasourceImpl implements DictionaryDatasource {
  final HttpCore _httpCore;

  const DictionaryDatasourceImpl({required HttpCore httpCore})
      : _httpCore = httpCore;

  @override
  Future<DictionaryModel> getWord(String word) async {
    final url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
    
    final response = await _httpCore.get(url);

    return DictionaryModel.fromJson(response.data[0]);
  }
}
