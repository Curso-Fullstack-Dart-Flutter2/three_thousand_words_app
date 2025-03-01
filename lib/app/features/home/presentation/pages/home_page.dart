import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/features/home/presentation/controllers/home_controller.dart';
import 'package:three_thousand_words/app/features/home/presentation/widgets/ttw_word_question_widget.dart';
import 'package:three_thousand_words/app/features/words/domain/entities/word_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.getWords();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao sair: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<List<WordEntity>>(
          stream: _controller.wordsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            }

            final words = snapshot.data ?? [];

            if (words.isEmpty) {
              return const Text('Nenhuma palavra encontrada.');
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final word = words[index];
                      return GestureDetector(
                        child: ListTile(
                          title: Text(word.word),
                        ),
                        onTap: () async {
                          final wordDictionary =
                              await _controller.searchWord(word.word);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return TtwWordQuestionWidget(
                                wordDictionary: wordDictionary,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.getWords(loadMore: true);
                  },
                  child: const Text('Carregar mais'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
