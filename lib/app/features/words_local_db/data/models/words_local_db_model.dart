import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';

class WordsLocalDbModel extends WordsLocalDbEntity {
  WordsLocalDbModel({
    required super.id,
    required super.word,
    required super.pronunciation,
    required super.meaning,
  });

  factory WordsLocalDbModel.fromJson(Map<String, dynamic> json) {
    return WordsLocalDbModel(
      id: json['id'] as int,
      word: json['word'] as String,
      pronunciation: json['pronunciation'] as String,
      meaning: json['meaning'] as String,
    );
  }
}
