import 'dart:async';

import 'package:flutter/material.dart';
import 'package:training_task/Resources/resoures.dart';


import '../Auth/View/signUpScreen.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp())); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Resource.image.logo),
      ),
    );
  }
}
