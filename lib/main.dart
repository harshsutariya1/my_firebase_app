import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase_app/ReuseableWidgets/default_widgets.dart';
import 'package:my_firebase_app/Screens/login_screen.dart';
import 'package:my_firebase_app/Screens/signup_screen.dart';
// import 'package:my_firebase_app/Screens/Home_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo App',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                Image.asset("assets/lock4.png"),
                const SizedBox(
                  height: 70,
                ),
                loginSignupButton(
                    text: "Login", context: context, ontap: LoginScreen()),
                const SizedBox(
                  height: 50,
                ),
                loginSignupButton(
                    text: "Sign up", context: context, ontap: SignupScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
