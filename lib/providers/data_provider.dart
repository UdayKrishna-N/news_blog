import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:news_blog_app/enums/loading_status.dart';
import '../models/article_model.dart';

class DataProvider extends ChangeNotifier{

  late LoadingStatus status;
  late List<Article> articles;

  DataProvider(){
    status = LoadingStatus.processing;
    articles = [];
  }

  void getData() async {
    var response = await rootBundle.loadString("articles_data");
    var jsonData = jsonDecode(response);
    for (Map<String, dynamic> data in jsonData) {
      Article article = Article.fromJson(data);
      articles.add(article);
    }
    status = LoadingStatus.completed;
    notifyListeners();
  }

}