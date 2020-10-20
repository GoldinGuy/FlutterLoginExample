import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FireloginApp());
}

class FireloginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'firelogin',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routes: {
          '/login': (_) => LoginPage(),
        },
        home: LoginPage());
  }
}
