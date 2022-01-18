import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/screens/auth_screen.dart';
import 'package:social_network_app/src/auth/screens/login_screen.dart';
import 'package:social_network_app/src/auth/screens/register_screen.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/auth/states/auth_state.dart';
import 'package:social_network_app/src/auth/states/authenticated_state.dart';
import 'package:social_network_app/src/auth/states/initial_state.dart';
import 'package:social_network_app/src/home/widgets/home_widget.dart';
import 'package:social_network_app/src/utils/app_routes.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<FirebaseApp> _fbApp;
  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    _fbApp = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.AUTH: (ctx) => const AuthScreen(),
        AppRoutes.LOGIN: (ctx) => const LoginScreen(),
        AppRoutes.REGISTER: (ctx) => const RegisterScreen(),
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
            _authService = context.read<AuthService>();
            return ValueListenableBuilder<AuthState>(
              valueListenable: _authService,
              builder: (_, state, child) {
                if (state is InitialState) {
                  const AuthScreen();
                } else if (state is AuthenticatedState) {
                  return const HomeWidget();
                }
                return const AuthScreen();
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
