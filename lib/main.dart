import 'package:firebase_app_web/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Agenda());
}

class Agenda extends StatelessWidget {
  Agenda({Key key}) : super(key: key);
  Color _primaryColor = HexColor('#03360c');
  Color _accentColor = HexColor('#0b5394');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Edenilson',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Color.fromARGB(255, 9, 75, 6),
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(title: 'Agenda Denilson'),
    );
  }
}
