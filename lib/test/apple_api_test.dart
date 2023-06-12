import 'package:flutter/material.dart';
import 'package:news_app/api/api_services/apple_api.dart';

import '../api/model/article_model.dart';

class AppleApiTest extends StatefulWidget {
  const AppleApiTest({Key? key}) : super(key: key);

  @override
  State<AppleApiTest> createState() => _AppleApiTestState();
}

class _AppleApiTestState extends State<AppleApiTest> {
  Widget getVerticalHeight({double? height}) => SizedBox(height: height ?? 10);
  AppleApi client = AppleApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getAppleArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>?> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommendation",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      getVerticalHeight(),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          )
                        ]),
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2.5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  getVerticalHeight(height: 20),
                                  Text("Apple"),
                                  getVerticalHeight(height: 70),
                                  Text(
                                    articles![index].title.toString(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
