import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/rtl_animation_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RTLFadeAnimationBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: Get.width / 2 - 20,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
