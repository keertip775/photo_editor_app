import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(HomePage());
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 171, 195),
      body: Container(
        child: Animate(
          effects: [FadeEffect(), ScaleEffect()],
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
