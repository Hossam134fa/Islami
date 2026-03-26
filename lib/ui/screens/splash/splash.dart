import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/onboarding/onboarding.dart';
import '../../utils/app_assets.dart';

class Splash extends StatelessWidget {
  static const String routeName = 'splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, Onboarding.routeName);
    });
    return Scaffold(
      body: Image.asset(AppAssets.splashBackground),
    );
  }
}
