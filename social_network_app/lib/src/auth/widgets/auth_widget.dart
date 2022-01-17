import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/auth/states/authenticated_state.dart';
import 'package:social_network_app/src/auth/states/error_state.dart';
import 'package:social_network_app/src/auth/states/initial_state.dart';
import 'package:social_network_app/src/auth/widgets/error_widget.dart';
import 'package:social_network_app/src/auth/widgets/initial_widget.dart';
import 'package:social_network_app/src/home/widgets/home_widget.dart';
import 'package:social_network_app/src/utils/app_routes.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService auth = context.read<AuthService>();
    return ValueListenableBuilder(
      valueListenable: auth,
      builder: (_, state, child) {
        if (state is InitialState) {
          return const InitialWidget();
        } else if (state is ErrorState) {
          return CustomErrorWidget(error: state.message);
        } else if (state is AuthenticatedState) {
 

          return const HomeWidget();
        } else {
          return const InitialWidget();
        }
      },
    );
  }
}
