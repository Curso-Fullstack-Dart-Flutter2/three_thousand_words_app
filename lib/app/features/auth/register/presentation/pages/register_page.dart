import 'package:flutter/material.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/widgets/three_thousand_form_field_widget.dart';
import 'package:three_thousand_words/app/features/auth/register/presentation/Controllers/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final _controller = getIt<RegisterController>();

  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ThreeThousandFormFieldWidget(
                    label: 'email',
                    controller: _email,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('Digite um email válido'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  ThreeThousandFormFieldWidget(
                    label: 'senha',
                    controller: _password,
                    validator: Validatorless.multiple([
                      Validatorless.required('senha obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve ter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  ThreeThousandFormFieldWidget(
                    label: 'confirme a senha',
                    controller: _confirmPassword,
                    validator: Validatorless.multiple([
                      Validatorless.required('senha obrigatória'),
                      Validatorless.compare(
                          _password, 'Campo deve ser igual ao de senha'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<bool>(
                      stream: _controller.loadingStream,
                      builder: (context, snapshot) {
                        final isLoading = snapshot.data ?? false;

                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: isLoading
                              ? null
                              : () async {
                                  final isFormValid =
                                      _formKey.currentState?.validate() ??
                                          false;

                                  if (isFormValid) {
                                    await _controller.register(
                                      email: _email.text,
                                      password: _password.text,
                                    );

                                    if (mounted) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback(
                                        (_) {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                            '/login',
                                            (route) => false,
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                          child: isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Registrar'),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<String?>(
              stream: _controller.errorStrem,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            TextButton(
              child: const Text('Já possui conta? Faça login'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
