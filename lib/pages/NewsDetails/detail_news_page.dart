import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/model/news_model.dart';
import 'package:lottie/lottie.dart';

class DetailNewsPage extends StatelessWidget {
  final NewsModel news;
  const DetailNewsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    NewsController _newscontroller = Get.put(NewsController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new),
                          Text('Back')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      '${news.urlToImage}',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error Details: $error');
                        return Container(
                          color: Colors.grey.shade200,
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.red,
                            size: 50,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: SizedBox(
                            height: 30, // Smaller size
                            width: 30, // Smaller size
                            child: CircularProgressIndicator(
                              strokeWidth: 2, // Thinner stroke
                            ),
                          ),
                        );
                      },
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                  child: Text(
                '${news.title}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20,
              ),
              Text('${news.publishedAt}'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    child: Text('${news.author![0]}'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    '${news.author}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Obx(() => IconButton(
                          onPressed: () async {
                            if (_newscontroller.isSpeaking.value) {
                              await _newscontroller.Stop();
                            } else {
                              await _newscontroller
                                  .speak(news.description ?? "No Description");
                            }
                          },
                          icon: Icon(_newscontroller.isSpeaking.value
                              ? Icons.stop
                              : Icons.play_arrow),
                        )),
                    Expanded(
                      child: Obx(() => SizedBox(
                            width: 300,
                            height: 60,
                            child: Lottie.asset(
                              'assets/voice_wave.json',
                              animate: _newscontroller.isSpeaking.value,
                              fit: BoxFit.fill,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Flexible(child: Text('${news.description}'))],
              )
            ],
          ),
        ),
      ),
    );
  }
}
