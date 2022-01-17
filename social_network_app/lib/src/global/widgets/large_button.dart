import 'package:flutter/material.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 55),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(accentColor),
        elevation: MaterialStateProperty.all(10.0),
      ),
    );
  }
}
