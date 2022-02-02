import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/custom_bottom_app_bar.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);
  static const routeName = '/projects';

  List<Widget> pages = [
    SizedBox(
      height: Get.height,
      child: Column(
        children: [
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2 - 30,
            width: Get.width,
            color: Colors.green,
          ),
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2 - 30,
            width: Get.width,
            color: Colors.blue,
          ),
        ],
      ),
    ),
    SizedBox(
      height: Get.height,
      child: Column(
        children: [
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2 - 30,
            width: Get.width,
            color: Colors.pink,
          ),
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2 - 30,
            width: Get.width,
            color: Colors.teal,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: false,
          fullTransitionValue: 500,
          enableSideReveal: true,
          initialPage: 0,
          positionSlideIcon: 0.8,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          waveType: WaveType.liquidReveal,
        ),
        bottomNavigationBar: CustomBottomAppBar(
          backgroundColor: Colors.black,
          onPage: OnPage.projects,
        ),
      ),
    );
  }
}
