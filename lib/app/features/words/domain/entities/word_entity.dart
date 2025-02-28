class WordEntity {
  final String word;

  WordEntity({required this.word});

  factory WordEntity.fromJson(Map<String, dynamic> json) {
    return WordEntity(word: json['word']);
  }

  Map<String, dynamic> toJson() {
    return {'word': word};
  }
}
