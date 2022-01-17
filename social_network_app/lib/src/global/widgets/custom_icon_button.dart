import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(36),
        boxShadow: const [
          BoxShadow(
            offset: Offset(
              4.0,
              4.0,
            ),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(icon),
      ),
    );
  }
}
