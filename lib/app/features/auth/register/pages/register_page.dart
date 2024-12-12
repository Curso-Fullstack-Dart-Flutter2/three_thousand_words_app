import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/core/widgets/three_thousand_form_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
                minWidth: constrains.minWidth,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            const ThreeThousandFormFieldWidget(label: 'nome'),
                            const SizedBox(height: 20),
                            const ThreeThousandFormFieldWidget(label: 'email'),
                            const SizedBox(height: 20),
                            const ThreeThousandFormFieldWidget(label: 'senha'),
                            const SizedBox(height: 20),
                            const ThreeThousandFormFieldWidget(
                                label: 'confirme a senha'),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('login'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        child: const Text('Já possui conta? faça login'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
