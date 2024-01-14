import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'login.dart';
import 'test_home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: _buildSplashWidget(context),
      nextScreen: TestHome(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
      backgroundColor: Color(0xFF1F67A9),
    );
  }

  Widget _buildSplashWidget(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width > 350
        ? 350
        : MediaQuery.of(context).size.width;
    double containerHeight = 90; // Set a fixed height that works for you

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            child: Image.asset(
              'assets/img/ease.png',
              fit: BoxFit.contain,
            ),
          ),
          // Add more widgets as needed
        ],
      ),
    );
  }
}
