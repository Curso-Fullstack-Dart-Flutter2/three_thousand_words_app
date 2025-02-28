import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  WordModel({required super.word});

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(word: json['word']);
  }
}
