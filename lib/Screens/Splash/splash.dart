import 'dart:async';

import 'package:flutter/material.dart';

import '../../Resource/resources.dart';
import '../Overview/overView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(OverView())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resource.colors.whiteColor,
      body: Center(
        child: Image.asset(Resource.images.logo),
      ),
    );
  }
}
