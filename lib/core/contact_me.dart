import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:samit_kapoor/components/slide_animation_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  ContactMe({Key? key}) : super(key: key);
  static const routeName = '/contact-me';

  List<Map<String, dynamic>> contactDetails = [
    {
      'icon': FontAwesomeIcons.github,
      'name': 'Github',
      'link': 'https://github.com/samitkapoor',
    },
    {
      'icon': FontAwesomeIcons.linkedin,
      'name': 'LinkedIn',
      'link': 'https://www.linkedin.com/in/samit-kapoor/',
    },
    {
      'icon': Icons.mail,
      'name': 'samitkapoor77@gmail.com',
      'link': 'https://www.gmail.com/',
    },
  ];

  Widget contactCard(Map<String, dynamic> contactDetail) {
    return GestureDetector(
      onTap: () {
        launch(contactDetail['link']);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              contactDetail['name'],
            ),
            const SizedBox(width: 10),
            Icon(
              contactDetail['icon'],
              color: Colors.white,
              size: 38,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/contact_me_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SlideAnimationBuilder(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...contactDetails.map((contactDetail) {
                    return contactCard(contactDetail);
                  }).toList(),
                ],
              ),
            ),
            begin: 1 * Get.width,
            end: 0,
            duration: const Duration(milliseconds: 350),
          ),
        ],
      ),
    );
  }
}
