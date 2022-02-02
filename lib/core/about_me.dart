import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/custom_bottom_app_bar.dart';
import 'package:samit_kapoor/components/opacity_animation_builder.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  static const routeName = '/about-me';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/about_me_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 325,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                height: 325 + Get.mediaQuery.padding.top / 2,
                padding:
                    EdgeInsets.fromLTRB(0, Get.mediaQuery.padding.top, 0, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/about_me_sliver_app_bar_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Hero(
                    tag: 'samit_kapoor',
                    child: Container(
                      height: 325,
                      width: 280,
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
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OpacityAnimationBuilder(
                      child: Text(
                        '" sic parvis magna "',
                        style: Get.theme.textTheme.bodyText1,
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                    OpacityAnimationBuilder(
                      child: Text(
                        '- Sir Francis Drake',
                        style: Get.theme.textTheme.bodyText2,
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                    OpacityAnimationBuilder(
                      child: Text(
                        '- Samit Kapoor',
                        style: Get.theme.textTheme.bodyText2,
                      ),
                      duration: const Duration(seconds: 4),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  'I am a Computer Science undergrad located in India, on my way to becoming a full-stack developer soon. I have a passion for happy, creative, and unique user interfaces with fast and dynamic user experience.\n\n I work with Flutter & Dart, and I also happen to speak C++ and C.\n\n I have had the experience of working as a Flutter developer in 2 startup projects. I am highly interested in learning more technologies to work on more projects.\n\n Besides programming and app development, I am also passionate about photography, watching movies, listening to good music, playing video games, piano, football.\n',
                  style: Get.theme.textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        backgroundColor: Colors.black,
        onPage: OnPage.about,
      ),
    );
  }
}
