import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  Color backgroundColor;
  CustomBottomAppBar({Key? key, required this.backgroundColor})
      : super(key: key);

  List<Map<String, dynamic>> icons = [
    {
      'icon': 'assets/images/samit_kapoor.jpg',
      'tooltip': 'About me',
    },
    {
      'icon': 'assets/images/projects_icon.png',
      'tooltip': 'Projects',
    },
    {
      'icon': 'assets/images/contact_me_icon.png',
      'tooltip': 'Contact me',
    }
  ];

  Widget getIcon({required Map<String, dynamic> iconDetail}) {
    return Tooltip(
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
