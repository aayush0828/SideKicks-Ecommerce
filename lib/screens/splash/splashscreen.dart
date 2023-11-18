import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/home'));
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://i.imgur.com/lfz8G1R.jpg',
              width: 250,
              height: 250,
            ),
          )
        ],
      ),
    );
  }
}
