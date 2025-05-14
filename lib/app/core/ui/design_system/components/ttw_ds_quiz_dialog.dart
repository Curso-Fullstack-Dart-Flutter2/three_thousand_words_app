import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_alternatives_quiz_buttom_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_primary_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class TtwDsQuizDialog extends StatefulWidget {
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
  State<TtwDsQuizDialog> createState() => _TtwDsQuizDialogState();
}

class _TtwDsQuizDialogState extends State<TtwDsQuizDialog> {
  String? selected;

  late final alternativesQuiz = [
    widget.correctTranslation,
    ...widget.wrongTranslations
  ]..shuffle();

  void _onConfirm() {
    final isCorrect = selected == widget.correctTranslation;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isCorrect ? 'Resposta correta!' : 'Resposta incorreta!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                widget.word,
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              const SizedBox(height: 10),
              Text(
                'Qual é a tradução correta?',
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const SizedBox(height: 50),
              ...alternativesQuiz.map((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TtwDsButton(
                      text: option,
                      style: TtwAlternativesQuizButtomStyle(
                        customButtomColor: selected == option
                            ? TtwDsColors.ttwWhite
                            : TtwDsColors.ttwGreen,
                      ),
                      action: () {
                        setState(() {
                          selected = option;
                        });
                      },
                    ),
                  )),
              const SizedBox(height: 20),
              const Spacer(),
              TtwDsButton(
                text: 'Confirmar',
                style: TtwPrimaryButtonStyle(),
                action: _onConfirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
