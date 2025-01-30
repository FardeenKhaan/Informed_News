import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_news_app/controller/bottom_nav_controller.dart';

class BottmNavBar extends StatelessWidget {
  const BottmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController _bottomNavController = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _bottomNavController.index.value = 0;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: _bottomNavController.index.value == 0
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    child: Icon(
                      Icons.home,
                      size: 25,
                      color: _bottomNavController.index.value == 0
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _bottomNavController.index.value = 1;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: _bottomNavController.index.value == 1
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    child: Icon(
                      Icons.book,
                      size: 25,
                      color: _bottomNavController.index.value == 1
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _bottomNavController.index.value = 2;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: _bottomNavController.index.value == 2
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    child: Icon(
                      Icons.person,
                      color: _bottomNavController.index.value == 2
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.primary,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
