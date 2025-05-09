import 'package:three_thousand_words/app/features/words/domain/entities/meta_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

abstract class PaginateWords {
  Future<List<String>> getWords(List<WordEntity> data, MetaEntity meta);
}
