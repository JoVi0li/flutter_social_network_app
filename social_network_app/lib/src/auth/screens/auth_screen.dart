import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/auth/states/auth_state.dart';
import 'package:social_network_app/src/auth/states/initial_state.dart';
import 'package:social_network_app/src/auth/states/loading_state.dart';
import 'package:social_network_app/src/auth/widgets/initial_widget.dart';
import 'package:social_network_app/src/auth/widgets/loading_widget.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthService auth;

  @override
  void initState() {
    super.initState();
    auth = context.read<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ValueListenableBuilder<AuthState>(
          valueListenable: auth,
          builder: (_, state, child) {
            if (state is InitialState) {
              return const InitialWidget();
            }  else if (state is LoadingState) {
              return const LoadingWidget();
            } else {
              return const InitialWidget();
            }
          },
        ),
      ),
    );
  }
}


// else if (state is AuthenticatedState) {
//               return const HomeWidget();
//             }