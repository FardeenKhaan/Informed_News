import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_news_app/components/navigationBar.dart';
import 'package:getx_news_app/controller/bottom_nav_controller.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController _bottomNavController = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: BottmNavBar(),
      body: Obx(
          () => _bottomNavController.pages[_bottomNavController.index.value]),
    );
  }
}
