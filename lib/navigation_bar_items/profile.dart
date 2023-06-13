import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/const/routes.dart';
import 'package:news_app/widgets/custom_button.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Widget getVerticalHeight({double? height}) => SizedBox(
        height: height ?? 450,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/new.jpeg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 10.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80.0,
                child: Icon(
                  Icons.person,
                  color: Colors.black87,
                  size: 70,
                ),
              ),
            ),
            getVerticalHeight(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: CustomButton(
                text: "Logout",
                onPressed: () {
                  try {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  } catch (e) {
                    print(
                      e.toString(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
