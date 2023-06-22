import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase_app/ReuseableWidgets/default_widgets.dart';
import 'package:my_firebase_app/Screens/home_screen.dart';
import 'package:my_firebase_app/Screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: appThemeContainer(
        context,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, size.height * 0.1, 20, 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/handholdsmobile.png"),
                reusableTextfield(
                    controller: _username,
                    hinttext: "Enter your name...",
                    label: "Full Name",
                    icon: Icons.person_pin_rounded,
                    ispasswordfield: false),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield(
                  controller: _email,
                  label: "Email Address",
                  hinttext: "Enter your email...",
                  icon: Icons.mail_outline_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield(
                  controller: _password,
                  label: "Password",
                  hinttext: "Create password...",
                  ispasswordfield: true,
                  icon: Icons.password_rounded,
                ),
                const SizedBox(
                  height: 20,
                ),
                loginSignupButton2(
                  ontap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _email.text, password: _password.text)
                        .then(
                          (value) => {
                            print("sign up successful"),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            )
                          },
                        )
                        .onError((error, stackTrace) =>
                            {print("Error occured: ${error.toString()}")});
                  },
                  text: "Sign UP",
                  context: context,
                ),
                loginOption(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row loginOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have account?",
        style: TextStyle(color: Colors.black54),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Text(
          "Login",
          style: TextStyle(color: Color.fromARGB(210, 255, 255, 255)),
        ),
      )
    ],
  );
}
