// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sahal/HomePage.dart';
import 'package:sahal/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getdata(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/Images/welcome.png',
          height: 500,
        ),
      ),
    );
  }

  Future<void> getdata(BuildContext context) async {
    final sahredprefes = await SharedPreferences.getInstance();
    final savedvalue = sahredprefes.getString('value');
    if (savedvalue != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const LoginPage(),
        ),
      );
    }
  }
}
