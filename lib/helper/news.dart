import 'package:http/http.dart' as http;
import 'package:fluttertry2/models/article.dart';
import 'dart:convert';

import 'package:fluttertry2/secret.dart';

class News {

  List<Article> news  = [];

  Future<void> getNews() async{

    String url = "http://34.70.13.196:80/get_data";

    var response = await http.get(url);
    
    var jsonData = jsonDecode(response.body);

    if(true){
      jsonData.forEach((element){

        if(element['summary'] != null){
          Article article = Article(
            title: element['title'],
            summary: element['summary'],
            urlToImage: element['image'],
            newsurl: element['url']
          );
          news.add(article);
        }

      });
    }
  }
  Future<void> getNewsLanguage(String choice) async{

    String url = "http://34.70.13.196:80/get_data";
    news  = [];
    var response = await http.get(url);
    
    var jsonData = jsonDecode(response.body);
    if(choice == "English"){
      choice = "";
    }
    else{
      choice += "_";
    }
    
    if(true){
      jsonData.forEach((element){

        if(element[choice+'summary'] != null){
          Article article = Article(
            title: element[choice+'title'],
            summary: element[choice+'summary'],
            urlToImage: element['image'],
            newsurl: element['url']
          );
          news.add(article);
        }

      });
    }
  }
}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://34.70.13.196:80/get_data?topic=$category";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(true){
      jsonData.forEach((element){

        if( element['summary'] != null){
          Article article = Article(
            title: element['title'],
            summary: element['summary'],
            urlToImage: element['image'],
            newsurl: element['url']
          );
          news.add(article);
        }
      });
    }
  }
}

