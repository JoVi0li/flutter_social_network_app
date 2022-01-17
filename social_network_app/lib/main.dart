import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_network_app/src/auth/services/auth_service.dart';
import 'package:social_network_app/src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MyApp(),
    ),
  );
}
