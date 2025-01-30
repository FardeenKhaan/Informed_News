import 'package:get/get.dart';
import 'package:getx_news_app/pages/ArticlePage/artticle_page.dart';
import 'package:getx_news_app/pages/ProfilePage/profile_page.dart';
import 'package:getx_news_app/pages/home_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArtticlePage(),
    ProfilePage(),
  ];
}
