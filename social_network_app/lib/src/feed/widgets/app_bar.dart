import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // titleSpacing: 0.0,
      toolbarHeight: 152,
      expandedHeight: 400,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      floating: true,
      shadowColor: shadowColor,
      elevation: 10,
      foregroundColor: Colors.white,
      titleTextStyle: Theme.of(context).textTheme.headline1,
      title: const Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: Text("Domingo,\n09 de Janeiro de 2022"),
      ),
      titleSpacing: 0.0,
      backgroundColor: accentColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 45,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(
                'assets/lottie/sunclouds_animation.json',
                width: 48,
              ),
              Text(
                '22°C',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Row(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              ],
            ),
            const TextField()
          ],
        ),
      ),
    );
  }
}
