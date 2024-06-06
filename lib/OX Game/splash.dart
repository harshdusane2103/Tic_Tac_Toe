import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Widget build(BuildContext context) {
    Timer(Duration(seconds:3),(){Navigator.pushReplacementNamed(context,'/sp');});
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Container(
            height: 400,
            width: 380,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sp.png"),
              )
            ),

          ),
          SizedBox(height: 200,),
          Align(
            alignment: Alignment.center,
              child: Text("Let's Play ....",style: TextStyle(color: Colors.white,fontSize: 18,),))
        ],
      ) ,
    );
  }
}
