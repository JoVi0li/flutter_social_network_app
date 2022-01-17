import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/auth/states/error_state.dart';
import 'package:social_network_app/src/global/widgets/custom_app_bar.dart';
import 'package:social_network_app/src/global/widgets/custom_divider.dart';
import 'package:social_network_app/src/global/widgets/custom_icon_button.dart';
import 'package:social_network_app/src/global/widgets/large_button.dart';
import 'package:social_network_app/src/global/widgets/outlined_input.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  register() async {
    try {
      await context.read<AuthService>().register(
            _emailController.text,
            _passwordController.text,
          );
    } on ErrorState catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'cadastro',
                subTitle: 'Escolha a forma que deseja para cadastrar-se',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 80.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          OutlinedInput(
                            label: 'Email',
                            obscureText: false,
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'O e-mail não pode ser vazio.';
                              } else if (email.length < 6) {
                                return 'E-mail inválido, informe outro e-mail.';
                              } else if (!email.contains('@')) {
                                return 'O e-mail deve conter o @.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          OutlinedInput(
                            label: 'Senha',
                            obscureText: true,
                            inputType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            validator: (senha) {
                              if (senha!.isEmpty) {
                                return 'A senha não pode ser vazia.';
                              } else if (senha.length < 6) {
                                return 'A senha deve conter no minímo seis caractéres';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 60),
                          LargeButton(
                            text: 'Cadastrar',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    const CustomDivider(
                      text: 'Cadastro social',
                      lineWidth: 0.25,
                    ),
                    const SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconButton(
                          icon: 'assets/icons/github.svg',
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          icon: 'assets/icons/google.svg',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
