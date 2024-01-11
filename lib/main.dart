import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

import 'register.dart';
import 'services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
