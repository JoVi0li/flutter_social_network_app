import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Tela home'),
            Text('Usuário cadastrado: ${user.displayName}')
          ],
        ),
      ),
    );
  }
}
