import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class AppleApi {
  final endPoint =
      "https://newsapi.org/v2/everything?q=apple&from=2023-06-11&to=2023-06-11&sortBy=popularity&apiKey=963248fe7e3947989f7a78657ca35d89";

  Future<List<Article>?> getAppleArticle() async {
    try {
      final response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;
      } else {
        throw ("Cannot fetch api");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
