import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_primary_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_words_list_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_app_bar.dart';
import 'package:three_thousand_words/app/features/words/presentation/widgets/ttw_ds_quiz_dialog.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/paginate_words_response_entity.dart';
import 'package:three_thousand_words/app/features/words/presentation/controllers/words_controller.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  final _controller = getIt<WordsController>();
  final Set<String> _correctWordsThisPage = {};

  int _lastPage = 1;

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  void _initializePage() async {
    final page = await _controller.fetchLastPage();

    setState(() {
      _lastPage = page;
    });

    await _controller.fetchWords(page: _lastPage);
  }

  void _loadMoreWords() async {
    final nextPage = _lastPage + 1;

    await _controller.fetchWords(page: nextPage);
    await _controller.toSendLastPage(nextPage);
    
    setState(() {
      _lastPage = nextPage;
      _correctWordsThisPage.clear(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TtwDsAppBar(title: 'words'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: StreamBuilder<PaginateWordsResponseEntity?>(
            stream: _controller.wordsStream,
            builder: (context, wordsSnapshot) {
              return switch (wordsSnapshot) {
                AsyncSnapshot(connectionState: ConnectionState.waiting) =>
                  const Center(child: CircularProgressIndicator()),
                AsyncSnapshot(hasData: true, data: final data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...data?.data.map((word) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TtwDsButton(
                                    text: word.palavra,
                                    style: TtwWordsListStyle(),
                                    action: () async {
                                      final wrongOptions = _controller
                                          .generateWrongTranslationsFor(word);

                                      final result = await showDialog<bool>(
                                        context: context,
                                        barrierColor: Colors.white
                                            .withAlpha((0.7 * 255).toInt()),
                                        barrierDismissible: true,
                                        builder: (context) => TtwDsQuizDialog(
                                          word: word.palavra,
                                          correctTranslation: word.traducao,
                                          wrongTranslations: wrongOptions,
                                          pronunciation: word.pronuncia,
                                        ),
                                      );

                                      if (result == true) {
                                        setState(() {
                                          _correctWordsThisPage
                                              .add(word.palavra);
                                        });
                                      }
                                    },
                                  ),
                                )) ??
                            [],
                        const Spacer(),
                        TtwDsButton(
                          text: 'Carregar mais palavras',
                          style: TtwPrimaryButtonStyle(),
                          action:
                              _correctWordsThisPage.length == data?.data.length
                                  ? _loadMoreWords
                                  : null,
                        ),
                      ]),
                AsyncSnapshot(hasError: true, error: final error) => Center(
                    child: Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
