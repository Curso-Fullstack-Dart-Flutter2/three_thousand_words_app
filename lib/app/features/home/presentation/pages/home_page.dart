import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_choice_button_home_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '👋 Olá!',
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              Text(
                'pronto para estudar hoje?',
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              const SizedBox(height: 8),
              Text(
                'Você memorizou 55 de 3000 palavras!',
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const SizedBox(height: 32),
              TtwDsButton(
                text: '📚 Estudar novas palavras',
                style: TtwChoiceButtonHomeStyle(
                    customButtomColor: TtwDsColors.ttwGreen),
                action: () => Navigator.pushNamed(context, '/words'),
              ),
              const SizedBox(height: 16),
              TtwDsButton(
                text: '🔁 Revisar palavras difíceis',
                style: TtwChoiceButtonHomeStyle(
                    customButtomColor: TtwDsColors.ttwOrange),
                action: () => Navigator.pushNamed(context, '/words_local_db'),
              ),
              const SizedBox(height: 16),
              TtwDsButton(
                text: '📈 Ver meu progresso',
                style: TtwChoiceButtonHomeStyle(
                    customButtomColor: TtwDsColors.ttwBlue),
                action: () {},
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
