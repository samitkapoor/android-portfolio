import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:samit_kapoor/core/profile_screen.dart';
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
        scaffoldBackgroundColor: Color(0xff01DAD9),
      ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
        GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen()),
      ],
    );
  }
}
