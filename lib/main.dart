import 'package:flutter/material.dart';
import 'package:tic_tce_toe_ui/OX%20Game/game.dart';
import 'package:tic_tce_toe_ui/OX%20Game/player.dart';
import 'package:tic_tce_toe_ui/OX%20Game/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>SplashScreen(),
      '/sp':(context)=>PlayerScreen(),
      '/game':(context)=>GameScreen(),
    },);
  }

}
