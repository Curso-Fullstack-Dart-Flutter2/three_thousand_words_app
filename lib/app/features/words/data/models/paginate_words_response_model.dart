import 'package:three_thousand_words/app/features/words/data/models/meta_model.dart';
import 'package:three_thousand_words/app/features/words/data/models/word_model.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';

class PaginateWordsResponseModel extends PaginateWordsResponseEntity {
  PaginateWordsResponseModel({required super.data, required super.meta});

  factory PaginateWordsResponseModel.fromJson(Map<String, dynamic> json) {
    return PaginateWordsResponseModel(
      data: (json['data'] as List)
          .map((item) => WordModel.fromJson(item))
          .toList(),
      meta: MetaModel.fromJson(json['meta']),
    );
  }
}
