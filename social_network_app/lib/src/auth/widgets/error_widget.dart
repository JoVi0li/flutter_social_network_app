import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/global/widgets/large_button.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(seconds: 3);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/error_animation.json',
              controller: _animationController,
            ),
            const SizedBox(height: 15),
            Text(
              'Ops! Parece que ocorreu um erro, tente novamente!',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'Excessão: ${widget.error}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30),
            LargeButton(
              text: 'Tentar novamente',
              onPressed: () {
                context.read<AuthService>().resetState();
              },
            ),
          ],
        ),
      ),
    );
  }
}
