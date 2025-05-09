import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  WordModel({
    required super.id,
    required super.palavra,
    required super.traducao,
    required super.pronuncia,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json['id'] as int,
      palavra: json['palavra'] as String,
      traducao: json['traducao'] as String,
      pronuncia: json['pronuncia'] as String,
    );
  }
}
