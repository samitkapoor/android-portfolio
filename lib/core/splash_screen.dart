import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/custom_page_route.dart';
import 'package:samit_kapoor/core/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween<double>(begin: Get.height, end: -200).animate(
      CurvedAnimation(
          parent: animationController!, curve: Curves.fastOutSlowIn),
    );

    animationController?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1200)).then((value) {
      Navigator.of(context).push(
        CustomPageRoute(child: ProfileScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(-0.09),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff060F1E),
                  Color(0xff08172E),
                  Color(0xff0E2B53),
                  Color(0xff124379),
                  Color(0xff105181),
                  Color(0xff0D7198),
                  Color(0xff089BB0),
                  Color(0xff06C4C8),
                  Color(0xff01DAD9),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animationController!,
            builder: (ctx, child) {
              return Positioned(top: animation!.value, child: child as Widget);
            },
            child: SizedBox(
              width: Get.width,
              child: Lottie.asset(
                'assets/animations/rocket_launch.json',
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
