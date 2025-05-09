import 'package:three_thousand_words/app/features/words/domain/entities/meta_entity.dart';

class MetaModel extends MetaEntity {
  MetaModel({
    required super.totalCount,
    required super.totalPages,
    required super.currentPage,
    required super.nextPage,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      totalCount: json['total'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
      nextPage: (json['currentPage'] as int) < (json['totalPages'] as int)
          ? (json['currentPage'] as int) + 1
          : (json['totalPages'] as int),
    );
  }
}
