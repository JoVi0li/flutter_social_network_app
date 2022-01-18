import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({Key? key, required this.success}) : super(key: key);

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
  final String success;
}

class _SuccessWidgetState extends State<SuccessWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
    );
    _animationController.duration = const Duration(seconds: 2);
    _animationController.forward();
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
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Lottie.asset(
              'assets/lottie/success_animation.json',
              controller: _animationController,
            ),
            Text(
              widget.success,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
