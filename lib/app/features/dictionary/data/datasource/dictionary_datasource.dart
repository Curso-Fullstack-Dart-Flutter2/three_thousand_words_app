import 'package:three_thousand_words/app/features/dictionary/data/models/dictionary_model.dart';

abstract class DictionaryDatasource {
  Future<DictionaryModel> getWord(String word);
}
