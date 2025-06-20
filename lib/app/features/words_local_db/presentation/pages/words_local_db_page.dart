import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_words_list_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_app_bar.dart';
import 'package:three_thousand_words/app/features/words_local_db/domain/entities/words_local_db_entity.dart';
import 'package:three_thousand_words/app/features/words_local_db/presentation/controllers/words_local_db_controller.dart';
import 'package:three_thousand_words/app/features/words_local_db/presentation/widgets/ttw_word_translate_widget.dart';

class WordsLocalDbPage extends StatefulWidget {
  const WordsLocalDbPage({super.key});

  @override
  State<WordsLocalDbPage> createState() => _WordsLocalDbPageState();
}

class _WordsLocalDbPageState extends State<WordsLocalDbPage> {
  final _controller = getIt<WordsLocalDbController>();

  @override
  void initState() {
    super.initState();

    _controller.fetchSavedWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TtwDsAppBar(title: 'saved words'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: StreamBuilder<List<WordsLocalDbEntity>>(
            stream: _controller.allWordsStream,
            builder: (context, wordsSnapshot) {
              return switch (wordsSnapshot) {
                AsyncSnapshot(connectionState: ConnectionState.waiting) =>
                  const Center(child: CircularProgressIndicator()),
                AsyncSnapshot(hasData: true, data: final data) =>
                  SingleChildScrollView(
                    child: Column(
                      children: data
                              ?.map((word) => Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TtwDsButton(
                                      text: word.word,
                                      style: TtwWordsListStyle(),
                                      action: () {
                                        showDialog(
                                          context: context,
                                          barrierColor: Colors.white
                                              .withAlpha((0.7 * 255).toInt()),
                                          barrierDismissible: true,
                                          builder: (context) =>
                                              TtwWordTranslateWidget(
                                            word: word.word,
                                            meaning: word.meaning,
                                          ),
                                        );
                                      },
                                    ),
                                  ))
                              .toList() ??
                          [],
                    ),
                  ),
                AsyncSnapshot(hasError: true, error: final error) =>
                  Center(child: Text('Error: $error')),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
