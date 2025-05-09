import 'package:three_thousand_words/app/features/words/data/models/meta_model.dart';
import 'package:three_thousand_words/app/features/words/data/models/word_model.dart';

class PaginateWordsResponseEntity {
  final List<WordModel> data;
  final MetaModel meta;

  PaginateWordsResponseEntity({
    required this.data,
    required this.meta,
  });
}
