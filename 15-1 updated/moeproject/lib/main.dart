import 'package:flutter/material.dart';
import 'splash.dart';
import 'testing.dart';
import 'first_register.dart';
import 'login.dart'; // Import your splash screen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyHomePage(),
        '/register': (context) => FirstRegisterPage(),
      },
    );
  }
}
