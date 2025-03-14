import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/pages/home_page.dart';
import 'package:foodapp/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              top: width * 1.12,
              right: 2,
              child: Image.asset(
                'images/corner.png',
                width: width * .5,
                height: height * .7,
                fit: BoxFit.contain,
              ),
            ),
            Image.asset(
              'images/food.png',
              width: width * .4,
              height: height * .09,
              fit: BoxFit.contain,
            ),
          ]),
        ),
      ),
    );
  }
}
