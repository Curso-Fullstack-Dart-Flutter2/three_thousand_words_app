import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/features/dictionary/domain/entities/dictionary_entity.dart';

class TtwWordQuestionWidget extends StatelessWidget {
  final DictionaryEntity wordDictionary;

  const TtwWordQuestionWidget({
    required this.wordDictionary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                wordDictionary.word,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Fonética'),
              ...wordDictionary.phonetics.map((phonetic) {
                return Column(
                  children: [
                    if (phonetic.text != null) Text(phonetic.text!),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Ouvir'),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              const Text('Significados'),
              const SizedBox(height: 10),
              ...wordDictionary.meanings.map((meaning) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaning.partOfSpeech,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...meaning.definitions.map((definition) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(definition.definition),
                            if (definition.example != null)
                              Text(
                                'Exemplo: ${definition.example}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  child: const Text('Fechar'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
