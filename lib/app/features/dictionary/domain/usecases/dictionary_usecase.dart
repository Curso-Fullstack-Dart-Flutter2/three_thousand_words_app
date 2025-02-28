import 'package:three_thousand_words/app/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryUsecase {
  Future<DictionaryEntity> getWord(String word);
}
