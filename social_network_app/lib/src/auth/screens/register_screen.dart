import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/auth/states/auth_state.dart';
import 'package:social_network_app/src/auth/states/error_state.dart';
import 'package:social_network_app/src/auth/states/initial_state.dart';
import 'package:social_network_app/src/auth/states/loading_state.dart';
import 'package:social_network_app/src/auth/states/success_state.dart';
import 'package:social_network_app/src/auth/widgets/error_widget.dart';
import 'package:social_network_app/src/auth/widgets/loading_widget.dart';
import 'package:social_network_app/src/auth/widgets/register_widget.dart';
import 'package:social_network_app/src/auth/widgets/success_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthService auth;

  @override
  void initState() {
    super.initState();
    auth = context.read<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthState>(
      valueListenable: auth,
      builder: (_, state, child) {
        if (state is InitialState) {
          return const RegisterWidget();
        } else if (state is LoadingState) {
          return const LoadingWidget();
        } else if (state is ErrorState) {
          return CustomErrorWidget(error: state.message);
        } else if (state is SuccessState) {
          return SuccessWidget(success: state.message);
        } else {
          return const RegisterWidget();
        }
      },
    );
  }
}
