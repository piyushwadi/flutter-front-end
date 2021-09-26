import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertry2/models/article.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../main.dart';

GetIt locator = GetIt.instance;
var appInfo = locator<LanguageService>();

class News {
  List<Article> news = [];
  Future<JsonCodec> readJson() async {
      final String response = await rootBundle.loadString('assets/news.json');
      var data = await json.decode(response);
      return data;
  }
  Future<void> getNews() async {
    // print("Application language set to " + appInfo.current);

    // String url = "http://34.70.13.196:80/get_data?topic=Latest+News";

    // var response = await http.get(url);
    var jsonData = readJson();
    // var jsonData = jsonDecode(response.body);

    if (true) {
      jsonData.forEach((element) {
        if (element['summary'] != null && element['topic'] == "Latest News") {
          Article article = Article(
              title: element['title'],
              summary: element['summary'],
              urlToImage: element['image'],
              newsurl: element['url']);
          news.add(article);
        }
      });
    }
  }

  Future<void> getNewsLanguage(String choice) async {
    // print("Application language set to " + appInfo.current);

    // String url = "http://34.70.13.196:80/get_data?language=$choice&topic=Latest+News";
    news = [];
    // var response = await http.get(url);
    var jsonData = readJson();
    // var jsonData = jsonDecode(response.body);
    if (choice == "English") {
      choice = "";
    } else {
      choice += "_";
    }

    if (true) {
      jsonData.forEach((element) {
        if (element[choice + 'summary'] != null  && element['topic'] == "Latest News") {
          Article article = Article(
              title: element[choice + 'title'],
              summary: element[choice + 'summary'],
              urlToImage: element['image'],
              newsurl: element['url']);
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    var lang = appInfo.current;
    // print("Application language set to " + lang);

    // entertainment
    // Entertainment

    // String url = "http://34.70.13.196:80/get_data?topic=$category";
    // String url = "http://34.70.13.196:80/get_data?topic=Entertainment";

    // var response = await http.get(url);

    // var jsonData = jsonDecode(response.body);
    // print(url);
    var jsonData = readJson();
    if (lang == "English") {
      lang = "";
    } else {
      lang += "_";
    }

    if (true) {
      jsonData.forEach((element) {
        if (element[lang + 'summary'] != null && element['topic'] == category {
          Article article = Article(
              title: element[lang + 'title'],
              summary: element[lang + 'summary'],
              urlToImage: element['image'],
              newsurl: element['url']);
          news.add(article);
        }
      });
    }
  }
}
