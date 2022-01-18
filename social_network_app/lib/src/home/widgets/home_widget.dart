import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().userAuthenticated;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Tela home'),
            Text('Usuário cadastrado: ${user!.email}')
          ],
        ),
      ),
    );
  }
}
