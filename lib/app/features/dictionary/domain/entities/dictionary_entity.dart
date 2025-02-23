class DictionaryEntity {
  final String word;
  final List<PhoneticEntity> phonetics;
  final List<MeaningEntity> meanings;
  final LicenseEntity license;
  final List<String> sourceUrls;

  DictionaryEntity({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });
}

class PhoneticEntity {
  final String? text;
  final String audio;
  final String? sourceUrl;
  final LicenseEntity? license;

  PhoneticEntity({
    this.text,
    required this.audio,
    this.sourceUrl,
    this.license,
  });
}

class MeaningEntity {
  final String partOfSpeech;
  final List<DefinitionEntity> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
}

class DefinitionEntity {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  DefinitionEntity({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });
}

class LicenseEntity {
  final String name;
  final String url;

  LicenseEntity({required this.name, required this.url});
}
