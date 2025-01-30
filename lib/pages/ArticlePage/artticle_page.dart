import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/pages/ArticlePage/search_widget.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/newsTile.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/newsTileLdgCard.dart';
import 'package:getx_news_app/pages/NewsDetails/detail_news_page.dart';

class ArtticlePage extends StatelessWidget {
  const ArtticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController _newscontroller = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SearchWidget(),
          SizedBox(height: 20),
          Obx(() => _newscontroller.isLoading.value
              ? ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Newstileldgcard();
                  })
              : Column(
                  children: _newscontroller.NewsForYou.map(
                    (e) => Newstile(
                      imageUrl: e.urlToImage ?? 'unknown',
                      time: e.publishedAt!,
                      title: e.title ?? 'Unknown',
                      author: e.author ?? 'unknown',
                      ontap: () {
                        Get.to(DetailNewsPage(news: e));
                      },
                    ),
                  ).toList(),
                ))
        ]),
      ),
    );
  }
}
