import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_network_app/src/auth/widgets/auth_widget.dart';
import 'package:social_network_app/src/auth/widgets/login_widget.dart';
import 'package:social_network_app/src/auth/widgets/register_widget.dart';
import 'package:social_network_app/src/utils/app_routes.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.AUTH: (ctx) => const AuthWidget(),
        AppRoutes.LOGIN: (ctx) =>  const LoginWidget(),
        AppRoutes.REGISTER: (ctx) => const RegisterWidget(),
      },
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.oswald(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.oswald(
            fontSize: 24.0,
            color: accentColor,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: GoogleFonts.poppins(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            
          ),
          
        ),
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              'Erro na inicialização do app: ${snapshot.error.toString()}',
            );
          } else if (snapshot.hasData) {
            return const AuthWidget();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
