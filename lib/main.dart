import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/config/themes.dart';
import 'package:getx_news_app/controller/homePageController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Informed Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemesColor.lightTheme,
        darkTheme: ThemesColor.darkTheme,
        themeMode: ThemeMode.system,
        home: Homepagecontroller());
  }
}
