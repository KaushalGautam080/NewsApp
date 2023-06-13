import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_news_box.dart';

import '../api/api_services/business_api.dart';
import '../api/model/article_model.dart';

class BusinessApiTest extends StatefulWidget {
  const BusinessApiTest({Key? key}) : super(key: key);

  @override
  State<BusinessApiTest> createState() => _BusinessApiTestState();
}

class _BusinessApiTestState extends State<BusinessApiTest> {
  BusinessApi businessClient = BusinessApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome,",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hello"),
              //search icon
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black87,
                  size: 40,
                ),
              ),
              // const SizedBox(width: 15),
              //notification icon
              IconButton(
                padding: const EdgeInsets.only(right: 20),
                onPressed: () {},
                icon: const Icon(
                  Icons.circle_notifications_rounded,
                  color: Colors.black87,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: businessClient.getBusinessApi(),
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
                        category: "Business",
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
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 80,
                width: 80,
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
