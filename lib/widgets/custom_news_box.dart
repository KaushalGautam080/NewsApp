import 'package:flutter/material.dart';

class CustomNewsBox extends StatelessWidget {
  String category;
  String title;
  String author;
  String publishedAt;
  String urlToImage;
  void Function() onPressed;

  CustomNewsBox({
    Key? key,
    required this.category,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.onPressed,
  }) : super(key: key);
  Widget getVerticalHeight({double? height}) => SizedBox(height: height ?? 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          blurStyle: BlurStyle.outer,
        )
      ]),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    blurStyle: BlurStyle.solid,
                  )
                ],
                color: Colors.grey,
                borderRadius: BorderRadius.circular(9.0),
                image: DecorationImage(
                  image: NetworkImage(urlToImage),
                  fit: BoxFit.fill,
                ),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerticalHeight(height: 20),
                Text(category),
                getVerticalHeight(),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getVerticalHeight(),
                Text(author),
                getVerticalHeight(),
                Text(publishedAt)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
