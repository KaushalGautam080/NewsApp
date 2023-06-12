import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/article_model.dart';

class BusinessApi {
  final endPoint =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=963248fe7e3947989f7a78657ca35d89";
  Future<List<Article>?> getBusinessApi() async {
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Failed to fetch api");
    }
  }
}
