import 'package:three_thousand_words/app/features/words/data/datasources/paginate_words.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/meta_entity.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

class PaginateWordsImpl implements PaginateWords {
  @override
  Future<List<String>> getWords(List<WordEntity> data, MetaEntity meta) {
    throw UnimplementedError();
  }
}
