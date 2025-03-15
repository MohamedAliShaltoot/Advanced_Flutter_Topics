import 'package:advanced_flutter_projects/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(child: Text('OnBoarding')),
    );
  }
}
