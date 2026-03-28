import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/ui/screens/onboarding/onboarding.dart';
import '../../utils/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, Onboarding.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splashBackground),
    );
  }
}
