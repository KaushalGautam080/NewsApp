import 'package:flutter/material.dart';
import 'package:news_app/api/api_services/apple_api.dart';
import 'package:news_app/widgets/custom_news_box.dart';

import '../api/model/article_model.dart';

class AppleApiTest extends StatefulWidget {
  const AppleApiTest({Key? key}) : super(key: key);

  @override
  State<AppleApiTest> createState() => _AppleApiTestState();
}

class _AppleApiTestState extends State<AppleApiTest> {
  AppleApi client = AppleApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Recommendation",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
        future: client.getAppleArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>?> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // to be made custom news box
                      CustomNewsBox(
                        category: "Apple",
                        title: articles![index].title.toString(),
                        author: articles![index].author.toString(),
                        publishedAt: articles![index].publishedAt.toString(),
                        urlToImage: articles![index].urlToImage.toString(),
                        onPressed: () {
                          print("News Pressed");
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.grey[300],
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black87,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
