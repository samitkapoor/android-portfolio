import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);
  static const routeName = '/about-me';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                flexibleSpace: Hero(
                  tag: 'samit_kapoor',
                  child: Container(
                    height: 325,
                    width: 325,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/about_me_sliver_app_bar_bg.png'),
                        fit: BoxFit.fitWidth,
                      ),
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                    child: Center(
                      child: Container(
                        height: 280,
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
            ],
          ),
        ),
      ),
    );
  }
}
