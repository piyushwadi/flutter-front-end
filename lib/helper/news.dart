import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertry2/models/article.dart';
import 'dart:convert';

import '../main.dart';

GetIt locator = GetIt.instance;
var appInfo = locator<LanguageService>();

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    // print("Application language set to " + appInfo.current);

    String url = "https://raw.githubusercontent.com/sonishreyas/sample-news-data/main/Latest_News.json";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

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
    String url = "https://raw.githubusercontent.com/sonishreyas/sample-news-data/main/Latest_News.json";
    news = [];
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (choice == "English") {
      choice = "";
    } else {
      choice += "_";
    }

    if (true) {
      jsonData.forEach((element) {
        if (element[choice + 'summary'] != null) {
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
    String url = "https://raw.githubusercontent.com/sonishreyas/sample-news-data/main/$category.json";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    // print(url);
    if (lang == "English") {
      lang = "";
    } else {
      lang += "_";
    }

    if (true) {
      jsonData.forEach((element) {
        if (element[lang + 'summary'] != null ){
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
