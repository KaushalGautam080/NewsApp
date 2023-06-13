import 'package:flutter/material.dart';
import 'package:news_app/screens/auth/login_screen.dart';
import 'package:news_app/screens/auth/register_screen.dart';
import 'package:news_app/screens/ui/home_screen.dart';
import 'package:news_app/test/apple_api_test.dart';

import 'const/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppleApiTest(),
      routes: {
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const RegisterScreen(),
        homeScreenRoute: (context) => const HomeScreen(),
      },
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform,
//         ),
//         builder: (context, snapshot) {
//           final user = FirebaseAuth.instance.currentUser;
//           if (user != null) {
//             return const HomeScreen();
//           } else {
//             return const LoginScreen();
//           }
//         });
//   }
// }
