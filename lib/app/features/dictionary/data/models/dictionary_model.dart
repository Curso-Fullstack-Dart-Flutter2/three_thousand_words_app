import 'dart:convert';

import 'package:three_thousand_words/app/features/dictionary/domain/entities/dictionary_entity.dart';

class DictionaryModel extends DictionaryEntity {
  DictionaryModel({
    required super.word,
    required List<PhoneticModel> super.phonetics,
    required List<MeaningModel> super.meanings,
    required LicenseModel super.license,
    required super.sourceUrls,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'],
      phonetics: (json['phonetics'] as List)
          .map((p) => PhoneticModel.fromJson(p))
          .toList(),
      meanings: (json['meanings'] as List)
          .map((m) => MeaningModel.fromJson(m))
          .toList(),
      license: LicenseModel.fromJson(json['license']),
      sourceUrls: List<String>.from(json['sourceUrls']),
    );
  }
}

class PhoneticModel extends PhoneticEntity {
  PhoneticModel(
      {super.text,
      required super.audio,
      super.sourceUrl,
      LicenseModel? super.license});

  factory PhoneticModel.fromJson(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'],
      audio: json['audio'] ?? '',
      sourceUrl: json['sourceUrl'],
      license: json['license'] != null
          ? LicenseModel.fromJson(json['license'])
          : null,
    );
  }
}

class MeaningModel extends MeaningEntity {
  MeaningModel({
    required super.partOfSpeech,
    required List<DefinitionModel> super.definitions,
    required super.synonyms,
    required super.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'],
      definitions: (json['definitions'] as List)
          .map((d) => DefinitionModel.fromJson(d))
          .toList(),
      synonyms: List<String>.from(json['synonyms']),
      antonyms: List<String>.from(json['antonyms']),
    );
  }
}

class DefinitionModel extends DefinitionEntity {
  DefinitionModel({
    required super.definition,
    required super.synonyms,
    required super.antonyms,
    super.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'],
      synonyms: List<String>.from(json['synonyms']),
      antonyms: List<String>.from(json['antonyms']),
      example: json['example'],
    );
  }
}

class LicenseModel extends LicenseEntity {
  LicenseModel({required super.name, required super.url});

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      name: json['name'],
      url: json['url'],
    );
  }
}

List<DictionaryModel> parseDictionaryEntries(String jsonStr) {
  final List<dynamic> jsonData = jsonDecode(jsonStr);
  return jsonData.map((entry) => DictionaryModel.fromJson(entry)).toList();
}
