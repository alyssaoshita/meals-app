import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import '../screens/tabs_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        onFinish: (BuildContext context) =>
            Navigator.pushNamed(context, TabsScreen.routeName),
        theme: FlameSplashTheme.dark,
        showAfter: (BuildContext context) {
          return Text(
            'Fire Meals',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed'),
          );
        },
      ),
    );
  }
}