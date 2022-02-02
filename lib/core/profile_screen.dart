import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/opacity_animation_builder.dart';
import 'package:samit_kapoor/components/rtl_animation_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0048e8),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/profile_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: RTLFadeAnimationBuilder(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Material(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width),
                ),
                color: Colors.black,
                child: Container(
                  height: Get.width / 1.7,
                  width: Get.width / 1.7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/samit_kapoor.jpg'),
                    ),
                    border: Border.all(color: Colors.black, width: 5),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text('Hi there! 👋', style: Get.theme.textTheme.caption),
              Text('📛 I\'m Samit Kapoor', style: Get.theme.textTheme.caption),
              const Spacer(),
              OpacityAnimationBuilder(
                child: Text('Tap anywhere to continue',
                    style: Get.theme.textTheme.overline),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
