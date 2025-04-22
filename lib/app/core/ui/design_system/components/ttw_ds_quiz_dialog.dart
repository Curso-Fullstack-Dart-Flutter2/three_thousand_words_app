import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_primary_buttom.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';

class TtwDsQuizDialog extends StatelessWidget {
  final String word;

  const TtwDsQuizDialog({
    required this.word,
    super.key,
  });

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
                word,
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              const SizedBox(height: 10),
              Text(
                'Qual é a tradução correta?',
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const SizedBox(height: 10),
              TtwDsPrimaryButtom(
                text: 'Árabe',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Americano',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Africano',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Bíblia',
                action: () {},
              ),
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
