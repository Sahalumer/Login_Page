// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sahal/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persons',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Noto Serif',
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                exit(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (stx, index) {
          int ind = index + 1;

          return ListTile(
            title: Text(
              'Person $ind',
              style: const TextStyle(fontFamily: 'Noto Serif'),
            ),
            subtitle: const Text(
              'New Massage',
              style: TextStyle(fontFamily: 'PTserif'),
            ),
            trailing:
                (index < 12) ? Text("$ind : 00 AM") : Text("$ind : 00 PM"),
            leading: (index % 2 == 0)
                ? const CircleAvatar(
                    backgroundImage: AssetImage('assets/Images/circle.png'),
                    radius: 28,
                  )
                : Image.asset('assets/Images/square.png'),
          );
        },
        //  separatorBuilder: (context, index) {
        //     return const Divider(
        //       height: 30,
        //     );
        //   },
        itemCount: 24,
      ),
    );
  }

  void exit(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Log out of your account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Noto Serif')),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                msg(context);
                forClear(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) {
                  return const LoginPage();
                }), (route) => false);
              },
              child: const Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void msg(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Logged Out",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.grey,
      ),
    );
  }

  forClear(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
