import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_primary_buttom.dart';
import 'package:three_thousand_words/app/core/ui/design_system/styles/ttw_ds_app_text_styles.dart';

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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "👋 Olá!",
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              Text(
                "pronto para estudar hoje?",
                style: TtwDsAppTextStyles.ttwStyleTitle(context),
              ),
              const SizedBox(height: 8),
              Text(
                "Você memorizou 55 de 3000 palavras!",
                style: TtwDsAppTextStyles.ttwStyleBody(context),
              ),
              const SizedBox(height: 32),
              TtwDsPrimaryButtom(
                text: "📚 Estudar novas palavras",
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: "🔁 Revisar palavras difíceis",
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: "📈 Ver meu progresso",
                action: () {},
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
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
