import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/const/routes.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("SignOut"),
          content: const Text("Are you sure want to SignOut?"),
          actions: [
            TextButton(
              onPressed: () async {
                final shouldLogOut = await showLogOutDialog(context);
                if (shouldLogOut) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                }
              },
              child: const Text(
                "Yes",
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
              ),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
