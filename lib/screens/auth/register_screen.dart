import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/show_error_dialog.dart';

import '../../const/routes.dart';
import '../../firebase_options.dart';
import '../../widgets/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              textInputType: TextInputType.emailAddress,
            ),
            getVerticalHeight(
              height: 50,
            ),

            InkWell(
              onTap: () async {
                try {
                  await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
                  );
                  final email = _email.text;
                  final password = _password.text;
                  final userCred = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  print(userCred);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'email-already-in-use') {
                    return await showErrorDialog(
                      context,
                      "Email is already in use",
                    );
                  } else if (e.code == 'invalid-email') {
                    return await showErrorDialog(
                      context,
                      "Please provide a valid email",
                    );
                  } else if (e.code == 'weak-password') {
                    return await showErrorDialog(
                      context,
                      "Too weak password",
                    );
                  } else {
                    return await showErrorDialog(context, 'Error: ${e.code}');
                  }
                } catch (e) {
                  return showErrorDialog(
                    context,
                    e.toString(),
                  );
                }

                // Navigator.pushNamed(context, loginRoute);
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
                    "Register",
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
                const Text("Already have an Account? "),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(loginRoute);
                  },
                  child: const Text(
                    "Login",
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
