// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_firebase_app/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFunctionality {
  void saveLoginData(
      {required String username, required String password}) async {
    print("login data saving...");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("Username", username);
    await preferences.setString("Password", password);
    print('Login data saved');
  }

  void checkLoginStatus({required ctx}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? username = preferences.getString("Username");
    String? password = preferences.getString("Password");
    if (username == null && password == null) {
      print("User is not Loged in.");
      preferences.setBool("isLogedin", false);
      // Navigator.pushReplacement(
      //     ctx, MaterialPageRoute(builder: (ctx) => const WelcomeScreen()));
    } else {
      print("User is already Loged in.");
      preferences.setBool("isLogedin", true);
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    }
  }

  void clearLoginData() async {
    print("user data clearing...");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("Username");
    await preferences.remove("Password");
    print("User data cleared");
  }
}
