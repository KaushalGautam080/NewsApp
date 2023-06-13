import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_button.dart';

class NewsCategory extends StatefulWidget {
  const NewsCategory({Key? key}) : super(key: key);

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "News Category",
          style: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 40.0, right: 30.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(text: "Apple News", onPressed: () {}),
              CustomButton(text: "Tesla News", onPressed: () {}),
              CustomButton(text: "Business News", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
