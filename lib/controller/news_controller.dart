import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForU();
  }

  var isDark = true.obs;
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> NewsForYou = <NewsModel>[].obs;
  FlutterTts flutterTts = FlutterTts();
  var showAllNews = false.obs;

  RxBool isLoading = false.obs;
  RxBool isSpeaking = false.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> getTrendingNews() async {
    isLoading.value = true;
    var baseurl =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dcf2aa92cbb5415b9b4b8dc9b2c2e2e6';
    try {
      var response = await http.get(Uri.parse(baseurl));
      print(response);
      if (response.statusCode == 200) {
        // print(response.body);
        // Now Take the resouces from api
        var body = jsonDecode(response.body);
        // print(body);

        // method to take the articles from our api
        var articals = body["articles"];
        for (var news in articals) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Something went wrong');
      }
    } catch (ex) {
      print(ex);
    }
    // debugPrint(trendingNewsList.toString());
    isLoading.value = false;
  }

  Future<void> getNewsForU() async {
    isLoading.value = true;
    var baseurl =
        'https://newsapi.org/v2/everything?q=apple&from=2025-01-23&to=2025-01-23&sortBy=popularity&apiKey=dcf2aa92cbb5415b9b4b8dc9b2c2e2e6';
    try {
      var response = await http.get(Uri.parse(baseurl));
      // print(response);
      if (response.statusCode == 200) {
        // print(response.body);
        // Now Take the resouces from api
        var body = jsonDecode(response.body);
        // print(body);

        // method to take the articles from our api
        var articals = body["articles"];
        for (var news in articals) {
          NewsForYou.add(NewsModel.fromJson(news));
        }
        // News4You.value = NewsForYou.sublist(0, 5).obs;
      } else {
        print('Something went wrong');
      }
    } catch (ex) {
      print(ex);
    }
    // debugPrint(NewsForYou.toString());
    isLoading.value = false;
  }

  Future<void> SearchSection(String search) async {
    isLoading.value = true;
    var baseurl =
        'https://newsapi.org/v2/everything?q=$search&apiKey=dcf2aa92cbb5415b9b4b8dc9b2c2e2e6';
    try {
      var response = await http.get(Uri.parse(baseurl));
      // print(response);
      print("Results found: ${response.body.length}");
      if (response.statusCode == 200) {
        // print(response.body);
        // Now Take the resouces from api
        var body = jsonDecode(response.body);
        // print(body);

        // method to take the articles from our api
        var articals = body["articles"];
        NewsForYou.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          NewsForYou.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
        // News4You.value = NewsForYou.sublist(0, 5).obs;
      } else {
        print('Something went wrong');
      }
    } catch (ex) {
      print(ex);
    }
    // debugPrint(NewsForYou.toString());
    isLoading.value = false;
  }

// for text to read functionality
  // Future<void> speak(String text) async {
  //   isSpeaking.value = true;
  //   await flutterTts.setLanguage("en-US");

  //   await flutterTts.setSpeechRate(1.0);

  //   await flutterTts.setVolume(1.0);

  //   await flutterTts.setPitch(1.0);

  //   await flutterTts.isLanguageAvailable("en-US");

  //   await flutterTts.speak(text);
  //   isSpeaking.value = false;
  // }

  // Future<void> Stop() async {
  //   await flutterTts.stop();
  //   isSpeaking.value = false;
  // }

  Future<void> speak(String text) async {
    if (!isSpeaking.value) {
      isSpeaking.value = true;
      await flutterTts.speak(text);
      flutterTts.setCompletionHandler(() {
        isSpeaking.value = false;
      });
    }
  }

  Future<void> Stop() async {
    if (isSpeaking.value) {
      await flutterTts.stop();
      isSpeaking.value = false;
    }
  }
}
