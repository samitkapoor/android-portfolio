import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/components/custom_page_route.dart';
import 'package:samit_kapoor/core/about_me.dart';
import 'package:samit_kapoor/core/contact_me.dart';
import 'package:samit_kapoor/core/projects.dart';

enum OnPage { about, projects, contact }

class CustomBottomAppBar extends StatelessWidget {
  Color backgroundColor;
  OnPage onPage;
  CustomBottomAppBar(
      {Key? key, required this.backgroundColor, required this.onPage})
      : super(key: key);

  Widget getIcon({required Map<String, dynamic> iconDetail}) {
    return InkWell(
      onTap: iconDetail['onPressed'],
      child: Tooltip(
        message: iconDetail['tooltip'],
        child: Container(
          width: Get.width / 3,
          color: backgroundColor,
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconDetail['icon']),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> icons = [
      {
        'icon': 'assets/images/samit_kapoor.jpg',
        'tooltip': 'About me',
        'onPressed': onPage == OnPage.about
            ? () {}
            : () {
                Navigator.of(context).pushReplacement(
                  CustomPageRoute(
                    child: About(),
                    transition: Transitions.slide,
                    duration: const Duration(milliseconds: 1000),
                    offset: const Offset(0, -1),
                  ),
                );
              },
      },
      {
        'icon': 'assets/images/projects_icon.png',
        'tooltip': 'Projects',
        'onPressed': onPage == OnPage.projects
            ? () {}
            : () {
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: Projects(),
                    transition: Transitions.slide,
                    duration: const Duration(milliseconds: 450),
                    offset: const Offset(0, 1),
                  ),
                );
              }
      },
      {
        'icon': 'assets/images/contact_me_icon.png',
        'tooltip': 'Contact me',
        'onPressed': onPage == OnPage.contact
            ? () {}
            : () {
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: ContactMe(),
                    transition: Transitions.slide,
                    duration: const Duration(milliseconds: 500),
                    offset: const Offset(1, 0),
                  ),
                );
              }
      }
    ];

    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...icons.map((iconDetail) {
            return getIcon(iconDetail: iconDetail);
          }).toList(),
        ],
      ),
    );
  }
}
