import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class TtwDsQuizCard extends StatelessWidget {
  final String word;
  final List<String> options;
  final Function(String) action;

  const TtwDsQuizCard({
    required this.word,
    required this.options,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TtwDsColors.ttwCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              word,
              style: TtwDsAppTextStyles.ttwStyleTitle(context),
            ),
            const SizedBox(height: 20),
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TtwDsColors.ttwGreen,
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    option,
                    style: TtwDsAppTextStyles.ttwStyleBody(context),
                  ),
                  onPressed: () => action(option),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
