import 'package:three_thousand_words/app/features/words/data/models/word_model.dart';

abstract class WordsDatasource {
  Future<List<WordModel>> fetchWords();
}
