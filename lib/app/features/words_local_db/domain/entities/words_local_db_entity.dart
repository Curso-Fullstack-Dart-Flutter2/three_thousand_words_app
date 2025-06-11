class WordsLocalDbEntity {
  final int? id;
  final String word;
  final String pronunciation;
  final String meaning;

  WordsLocalDbEntity({
    this.id,
    required this.word,
    required this.pronunciation,
    required this.meaning,
  });
}
