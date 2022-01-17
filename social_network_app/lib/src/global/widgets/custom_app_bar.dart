import 'package:flutter/material.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      width: MediaQuery.of(context).size.width,
      height: 153.0,
      decoration: const BoxDecoration(
        color: accentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4.0, 4.0),
            blurRadius: 4.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.24),
                child: Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}