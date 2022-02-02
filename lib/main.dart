import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/core/about_me.dart';
import 'package:samit_kapoor/core/contact_me.dart';
import 'package:samit_kapoor/core/profile_screen.dart';
import 'package:samit_kapoor/core/projects.dart';
import 'package:samit_kapoor/core/splash_screen.dart';

void main() {
  runApp(SamitKapoor());
}

class SamitKapoor extends StatelessWidget {
  const SamitKapoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          caption: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            wordSpacing: 1,
            fontFamily: 'LoveGlitter',
          ),
          overline: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontFamily: 'Comfortaa',
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen()),
        GetPage(name: About.routeName, page: () => About()),
        GetPage(name: ContactMe.routeName, page: () => ContactMe()),
        GetPage(name: Projects.routeName, page: () => Projects()),
      ],
    );
  }
}
