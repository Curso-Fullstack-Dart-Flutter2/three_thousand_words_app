import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/widgets/three_thousand_form_field_widget.dart';
import 'package:three_thousand_words/app/features/auth/login/presentation/controllers/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = getIt<LoginController>();

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
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
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      final isFormValid =
                                          _formKey.currentState?.validate() ??
                                              false;

                                      if (isFormValid) {
                                        await _controller.login(
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
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Login'),
                                    ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              StreamBuilder<String?>(
                stream: _controller.errorStream,
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
              SignInButton(
                Buttons.Google,
                text: 'Entrar com o google',
                padding: const EdgeInsets.all(5),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Não possui conta, cadastre-se'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
