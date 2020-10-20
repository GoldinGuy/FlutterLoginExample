import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ClipsApp());
}

class ClipsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clips',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routes: {'/login': (_) => LoginPage(), '/home': (_) => HomePage()},
        home: LoginPage());
  }
}

// /// Provides a UI to select a authentication type page
// class AuthTypeSelector extends StatelessWidget {
//   // Navigates to a new page
//   void _pushPage(BuildContext context, Widget page) {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(builder: (_) => page),
//     );
//   }
// }
