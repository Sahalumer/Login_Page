// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sahal/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<LoginPage> {
  final _usernamecontroller = TextEditingController();

  final _passWordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final String _user = 'Sahal';
  final String _pass = '8590';
  final bool autoValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        controller: _usernamecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "UserName",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "UserName is Empty";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passWordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "PassWord",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "PassWord is Empty";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                gotoIn(context);
                              }
                            },
                            icon: const Icon(Icons.check),
                            label: const Text('Login'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void gotoIn(BuildContext context) async {
    final userName = _usernamecontroller.text;
    final passWord = _passWordcontroller.text;
    if (userName == _user && passWord == _pass) {
      final preferes = await SharedPreferences.getInstance();
      await preferes.setString('value', userName);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid UserName Or Password"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  saveData(value) async {}
}
