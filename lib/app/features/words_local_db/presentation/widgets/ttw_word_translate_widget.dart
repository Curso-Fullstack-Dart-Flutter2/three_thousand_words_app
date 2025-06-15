import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_primary_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';

class TtwWordTranslateWidget extends StatelessWidget {
  final String word;
  final String meaning;

  const TtwWordTranslateWidget({
    super.key,
    required this.word,
    required this.meaning,
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
                meaning,
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const Spacer(),
              TtwDsButton(
                text: 'Confirmar',
                style: TtwPrimaryButtonStyle(),
                action: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
