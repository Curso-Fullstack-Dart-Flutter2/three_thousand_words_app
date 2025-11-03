import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:three_thousand_words/app/app_module.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/styles/ttw_primary_button_style.dart';
import 'package:three_thousand_words/app/core/ui/design_system/components/buttons/ttw_ds_button.dart';
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

    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ttw_logo.png', width: 200),
              const SizedBox(height: 20),
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
                    return TtwDsButton(
                      text: 'Entrar',
                      action: () async {
                        final isFormValid =
                            _formKey.currentState?.validate() ?? false;

                        if (isFormValid) {
                          await _controller.login(
                            email: _email.text,
                            password: _password.text,
                          );

                          if (mounted) {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home',
                                  (route) => false,
                                );
                              },
                            );
                          }
                        }
                      },
                      style: TtwPrimaryButtonStyle(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SignInButton(
                  Buttons.Google,
                  text: 'Entrar com o google',
                  padding: const EdgeInsets.all(5),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () async {
                    await _controller.googleLogin();

                    if (mounted) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home',
                            (route) => false,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              TextButton(
                child: const Text('Não possui conta, cadastre-se'),
                onPressed: () => Navigator.of(context).pushNamed('/register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
