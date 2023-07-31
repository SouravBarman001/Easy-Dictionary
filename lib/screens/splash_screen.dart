import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/splash_screen_controller.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

SplashScreenController screenController = SplashScreenController();

  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to HomeScreen
    Timer(const Duration(seconds: 8), () {
      screenController.splashScreenPassed(true);
      Get.offAllNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff218eee),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('images/dictionary.gif',width: 300,height: 300,fit: BoxFit.cover,)),
            const SizedBox(height: 10,),
            // Center(
            //   child: SizedBox(
            //     width: 350.0,
            //     child: TextLiquidFill(
            //       loadDuration: const Duration(seconds: 6),
            //       text: 'Easy Dictionary',
            //       waveColor: Colors.blue,
            //       boxBackgroundColor: const Color(0xfffafafa),
            //       textStyle: const TextStyle(
            //         fontSize: 50.0,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Roboto', // Built-in font family
            //
            //       ),
            //       boxHeight: 250.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
