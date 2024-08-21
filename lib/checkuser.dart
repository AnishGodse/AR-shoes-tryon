import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauthentication/loginpage.dart';
import 'package:firebaseauthentication/myhomepage.dart';

class checkUser extends StatefulWidget {
  const checkUser({Key? key}) : super(key: key);

  @override
  State<checkUser> createState() => _checkUserState();
}

class _checkUserState extends State<checkUser> {
  late Future<Widget> _initialScreen = checkUser();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _initialScreen,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return snapshot.data ?? Scaffold();
        }
      },
    );
  }

  Future<Widget> checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MyHomePage(title: "HomePage");
    } else {
      return LoginPage();
    }
  }
}
