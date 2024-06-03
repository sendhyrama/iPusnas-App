import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Colors.white;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Set the status bar icons to light
    ));

    return AnimatedSplashScreen(
      splash: Center(
        // Center the column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
      nextScreen: const HomeScreen(),
      splashIconSize: 800,
      backgroundColor: bgColor,
      duration: 4000,
    );
  }
}
