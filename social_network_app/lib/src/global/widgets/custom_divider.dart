import 'package:flutter/material.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.lineWidth,
    required this.text,
  }) : super(key: key);

  final double lineWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * lineWidth,
          height: 3.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: accentColor,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Container(
          width: MediaQuery.of(context).size.width * lineWidth,
          height: 3.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: accentColor,
          ),
        ),
      ],
    );
  }
}
