import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/trendingLdgCard.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/newsTile.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/newsTileLdgCard.dart';
import 'package:getx_news_app/pages/HomePage/Widgets/trendingCard.dart';
import 'package:getx_news_app/pages/NewsDetails/detail_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    NewsController _newscontroller = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    Text(
                      "Informed Tech",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () {
                            _newscontroller.changeTheme();
                          },
                          icon: Icon(
                            _newscontroller.isDark.value
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: theme.iconTheme.color,
                          )),
                    ),
                  ],
                ),
                Divider(
                  height: 20, // Space the divider occupies
                  thickness: 2, // Thickness of the line
                  color: Colors.grey, // Color of the line
                  indent: 10, // Space before the line starts
                  endIndent: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hottest News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => _newscontroller.isLoading.value
                          ? Row(
                              children: List.generate(
                                  5, (index) => TrendingLdgcard()))
                          : Row(
                              children: _newscontroller
                                  .trendingNewsList()
                                  .map(
                                    (e) => Trendingcard(
                                      imageUrl: e.urlToImage ??
                                          'https://media.gettyimages.com/id/2194587019/photo/president-trump-delivers-remarks-announces-infrastructure-plan-at-white-house.jpg?s=1024x1024&w=gi&k=20&c=-OhZRQGv0yAMUlhKa77XjSRlRa9Ru9Ad_jiqMGpY03c=',
                                      tag: 'Trending no 1',
                                      time: e.publishedAt!,
                                      title: e.title ?? 'Unknown',
                                      author: e.author ?? 'unknown',
                                      ontap: () {
                                        Get.to(DetailNewsPage(
                                          news: e,
                                        ));
                                      },
                                    ),
                                  )
                                  .toList()),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News for you',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    InkWell(
                      onTap: () {
                        _newscontroller.showAllNews.value =
                            !_newscontroller.showAllNews.value;
                      },
                      child: Obx(() => Text(
                            _newscontroller.showAllNews.value
                                ? 'Show Less'
                                : 'See All',
                            style: Theme.of(context).textTheme.labelSmall,
                          )),
                    ),
                  ],
                ),
                Obx(() => _newscontroller.isLoading.value
                    ? Column(
                        children: [Newstileldgcard(), Newstileldgcard()],
                      )
                    : Column(
                        children: (_newscontroller.showAllNews.value
                                ? _newscontroller.NewsForYou
                                : _newscontroller.NewsForYou.take(5))
                            .map(
                              (e) => Newstile(
                                imageUrl: e.urlToImage ?? 'unknown',
                                time: e.publishedAt!,
                                title: e.title ?? 'Unknown',
                                author: e.author ?? 'unknown',
                                ontap: () {
                                  Get.to(DetailNewsPage(news: e));
                                },
                              ),
                            )
                            .toList(),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
