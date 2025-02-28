import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:three_thousand_words/app/features/words/data/datasources/words_datasource.dart';
import 'package:three_thousand_words/app/features/words/data/models/word_model.dart';

class WordsDatasourceImpl implements WordsDatasource {
  WordsDatasourceImpl();

  @override
  Future<List<WordModel>> fetchWords() async {
      final String jsonString = await rootBundle.loadString('assets/words.json');
      List<dynamic> jsonList = json.decode(jsonString);

      return jsonList.map((json) => WordModel.fromJson(json)).toList();
  }
}
