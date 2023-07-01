// ignore_for_file: file_names
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase_app/ReuseableWidgets/default_widgets.dart';
import 'package:my_firebase_app/Screens/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ReuseableWidgets/login_functionality.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url =
      "https://github.com/harshsutariya1/my_firebase_app/tree/8ea2ec2c7eb1cd44145b30222cd22dda52c722cc/lib";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appThemeContainer(
        context,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
              child: OutlinedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                },
                icon: const Icon(
                  Icons.code,
                  color: Colors.white,
                ),
                label: const Text(
                  "View Source Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) => {
                        print("signed out"),
                        LoginFunctionality().clearLoginData(),
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        )
                      });
                },
                child: const Text(
                  "Log out",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
