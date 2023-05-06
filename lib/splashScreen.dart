import 'dart:async';
import 'package:bmiapplication/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyHomePage() ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade300,
        child: Center(
          child: Text('Know Your BMI',style: TextStyle(fontSize: 34,color: Colors.black),),
        ),
      ),
      
    );
  }
}
