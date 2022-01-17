import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_network_app/src/global/widgets/large_button.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.error}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/error_animation.json'),
            const SizedBox(height: 15),
            Text(
              'Ops! Parece que ocorreu um erro, tente novamente!',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'Excessão: $error',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30),
            LargeButton(
              text: 'Tentar novamente',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
