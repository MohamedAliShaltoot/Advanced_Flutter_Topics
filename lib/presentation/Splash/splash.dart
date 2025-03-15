import 'dart:async';

import 'package:advanced_flutter_projects/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_projects/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

Timer? _timer;

delayTimer(){
  _timer = Timer(const Duration(seconds: 3), _goNext);
}

_goNext(){
  Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
}

@override
void initState() {
 
  super.initState();
  delayTimer();
}

@override

void dispose() {
  _timer?.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Image(
        image: AssetImage(ImageAssets.splashLogo),
      )),
    );
  }
}
