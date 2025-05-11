import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_primary_buttom.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';

class TtwDsQuizDialog extends StatelessWidget {
  final String word;
  final String correctTranslation;
  final List<String> wrongTranslations;

  const TtwDsQuizDialog({
    required this.word,
    required this.correctTranslation,
    required this.wrongTranslations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final alternativesQuiz = [correctTranslation, ...wrongTranslations]
      ..shuffle();

    return Dialog(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                word,
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              const SizedBox(height: 10),
              Text(
                'Qual é a tradução correta?',
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const SizedBox(height: 10),
              ...alternativesQuiz.map((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TtwDsPrimaryButtom(
                      text: option,
                      action: () {
                        final isCorrect = option == correctTranslation;
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isCorrect
                                ? 'Correto! 🎉'
                                : 'Errado 😢. Correto: $correctTranslation'),
                          ),
                        );
                      },
                    ),
                  )),
              const SizedBox(height: 20),
              TtwDsPrimaryButtom(
                text: 'Confirmar',
                action: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
