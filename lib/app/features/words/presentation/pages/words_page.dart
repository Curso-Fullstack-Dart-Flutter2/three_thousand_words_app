import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_app_bar.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/ttw_ds_primary_buttom.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TtwDsAppBar(title: 'words'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TtwDsPrimaryButtom(
                text: 'Apple',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Apple',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Apple',
                action: () {},
              ),
              const SizedBox(height: 16),
              TtwDsPrimaryButtom(
                text: 'Apple',
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
