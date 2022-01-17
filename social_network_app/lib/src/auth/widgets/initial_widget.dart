import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:social_network_app/src/global/widgets/medium_button.dart';
import 'package:social_network_app/src/utils/app_routes.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          bottom: 100,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Text(
                'instadev'.toUpperCase(),
                style: GoogleFonts.oswald(
                  fontSize: 64.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Conecte-se com milhares de\ndesenvolvedores ao redor do mundo',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Lottie.asset('assets/lottie/world_animation.json'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediumButton(
                  text: 'Sou novo aqui!',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.REGISTER);
                  },
                ),
                MediumButton(
                  text: 'Já tenho conta!',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.LOGIN);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
