// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase_app/ReuseableWidgets/default_widgets.dart';
import 'package:my_firebase_app/Screens/home_screen.dart';
import 'package:my_firebase_app/Screens/signup_screen.dart';

import '../ReuseableWidgets/login_functionality.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: appThemeContainer(
        context,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, size.height * 0.1, 20, 0),
            child: Column(
              children: [
                Image.asset("assets/40.png"),
                const SizedBox(
                  height: 50,
                ),
                reusableTextfield(
                  hinttext: "Enter your email address...",
                  label: "Email Address",
                  controller: _username,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 30,
                ),
                reusableTextfield(
                  hinttext: "Enter Password",
                  label: "Password",
                  ispasswordfield: true,
                  controller: _password,
                  icon: Icons.lock_outline_rounded,
                ),
                const SizedBox(
                  height: 30,
                ),
                loginSignupButton2(
                    text: "Login",
                    context: context,
                    ontap: () {
                      LoginFunctionality().clearLoginData();
                      LoginFunctionality().saveLoginData(
                          username: _username.text, password: _password.text);
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _username.text, password: _password.text)
                          .then((value) {
                        print("Login successfully");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      }).onError((error, stackTrace) {
                        print("error occured : ${error.toString()}");
                      });
                    }),
                signupOption(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signupOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have account?",
        style: TextStyle(color: Colors.black54),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignupScreen()));
        },
        child: const Text(
          "SignUP",
          style: TextStyle(color: Color.fromARGB(210, 255, 255, 255)),
        ),
      )
    ],
  );
}
