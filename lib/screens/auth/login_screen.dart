import 'package:flutter/material.dart';

import '../../const/routes.dart';
import '../../widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget getVerticalHeight({double? height}) => SizedBox(height: height ?? 20);
  bool obscureText = true;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.3,
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            getVerticalHeight(height: 50),
            //Email
            CustomFormField(
              controller: _email,
              iconData: Icons.email_outlined,
              hintText: "Enter your email",
            ),
            getVerticalHeight(),
            //Password
            CustomFormField(
              controller: _password,
              obscureText: obscureText,
              iconData: Icons.key_outlined,
              hintText: "Password",
              onPressedEye: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            getVerticalHeight(height: 50),

            InkWell(
              onTap: () {
                print("login");
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            getVerticalHeight(height: 280),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account? "),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(registerRoute);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
