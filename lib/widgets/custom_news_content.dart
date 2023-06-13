import 'package:flutter/material.dart';
import 'package:news_app/api/model/article_model.dart';

class CustomNewsContent extends StatelessWidget {
  Future<List<Article>>? future;
  String content;
  CustomNewsContent({
    Key? key,
    required this.future,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Text(content),
          );
        });
  }
}
