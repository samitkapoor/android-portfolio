import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/custom_page_route.dart';
import 'package:samit_kapoor/components/opacity_animation_builder.dart';
import 'package:samit_kapoor/components/slide_animation_builder.dart';
import 'package:samit_kapoor/core/about_me.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0048e8),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CustomPageRoute(
              child: const About(),
              transition: Transitions.slide,
              duration: const Duration(milliseconds: 1000),
              offset: const Offset(0, -1),
            ),
          );
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/profile_screen_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SlideAnimationBuilder(
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
                  child: Hero(
                    tag: 'samit_kapoor',
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
                ),
                const SizedBox(height: 50),
                Text('Hi there! 👋', style: Get.theme.textTheme.caption),
                Text('📛 I\'m Samit Kapoor',
                    style: Get.theme.textTheme.caption),
                const Spacer(),
                OpacityAnimationBuilder(
                  child: Text(
                    'Tap anywhere to continue',
                    style: Get.theme.textTheme.overline,
                  ),
                  duration: const Duration(seconds: 3),
                ),
                const SizedBox(height: 20),
              ],
            ),
            begin: -1 * Get.width,
            end: 0,
          ),
        ),
      ),
    );
  }
}
