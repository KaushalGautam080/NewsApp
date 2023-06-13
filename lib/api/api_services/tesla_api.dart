import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class TeslaApi {
  final endPoint =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-05-13&sortBy=publishedAt&apiKey=963248fe7e3947989f7a78657ca35d89";
  Future<List<Article>?> getTeslaApi() async {
    final response = await http.get(Uri.parse(endPoint));
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;
      } else {
        throw ("Failed to fetch api");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
