import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:samit_kapoor/components/custom_bottom_app_bar.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);
  static const routeName = '/projects';

  List<Map<String, dynamic>> projectsDetails = [
    {
      'image1': 'assets/images/instagram_project.jpg',
      'name1': 'Instagram UI',
      'link1': 'https://github.com/samitkapoor/instagram-ui',
      'image2': 'assets/images/spotify_project.jpg',
      'name2': 'Spotify UI',
      'link2': 'https://github.com/samitkapoor/spotify-ui',
    },
    {
      'image1': 'assets/images/sitsmart_project.jpg',
      'name1': 'sitsmart',
      'link1': 'https://github.com/samitkapoor/sitsmart',
      'image2': 'assets/images/netflix_project.jpg',
      'name2': 'Netflix UI',
      'link2': 'https://github.com/samitkapoor/netflix-ui',
    },
    {
      'image1': 'assets/images/whatsapp_project.jpg',
      'name1': 'Whatsapp UI',
      'link1': 'https://github.com/samitkapoor/whatsapp-ui',
      'image2': 'assets/images/stopwatch_project.jpg',
      'name2': 'stopwatch',
      'link2': 'https://github.com/samitkapoor/stopwatch',
    },
  ];

  Widget getHalfPage(String image, String name, String link) {
    return GestureDetector(
      onTap: () {
        launch(link);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: Get.height / 2 - Get.mediaQuery.padding.top / 2,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.black45,
              border: Border.all(color: Colors.black, width: 5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: Get.theme.textTheme.headline4,
              ),
              const Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
                size: 64,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getOnePage(Map<String, dynamic> pageDetail) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          getHalfPage(
              pageDetail['image1'], pageDetail['name1'], pageDetail['link1']),
          getHalfPage(
              pageDetail['image2'], pageDetail['name2'], pageDetail['link2']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          pages: [
            ...projectsDetails.map((pageDetail) {
              return getOnePage(pageDetail);
            }).toList(),
          ],
          enableLoop: true,
          fullTransitionValue: 450,
          initialPage: 0,
          waveType: WaveType.liquidReveal,
        ),
      ),
    );
  }
}
