import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthentication/forgotpassword.dart';
import 'package:firebaseauthentication/myhomepage.dart';
import 'package:firebaseauthentication/signuppage.dart';
import 'package:firebaseauthentication/uihelper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //making controllers for input
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      uihelper.CustomAlertBox(context, "Enter required fields!");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Login")));
        });
      } on FirebaseAuthException catch (ex) {
        return uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/shoelogo.png'),
                ),
                SizedBox(
                  width: 1,
                ),
                Column(children: [
                  Text(
                    'Shoes Try-On',
                    style: TextStyle(color: Colors.black, fontSize: 30,fontFamily: 'Pacifico'),
                  ),
                ])
              ],
            ),
            const SizedBox(height: 5,),
            Center(
              child: Text(
                'Transforming the user experience!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pacifico',
                    color: Colors.black54),
              ),
            ),
            const SizedBox(height: 75,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: uihelper.CustomTextField(emailController, 'Email', Icons.mail_outline_rounded, false),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: uihelper.CustomTextField(passwordController, 'Password', Icons.lock_open_rounded, true),
            ),
            const SizedBox(height: 80,),
            uihelper.customButton(() {
              login(emailController.text.toString(), passwordController.text.toString());
            }, "Login"),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Not a user?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Pacifico',
                        color: Colors.black),
                  ),
                ),
                const SizedBox(width: 1,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  }, child: const Text('Sign up',style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Pacifico',
                  color: Colors.blueAccent,
                ),),
                ),
              ],
            ),
            const SizedBox(height: 1,),
            TextButton(onPressed:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
            },child: const Text("Forgot Password??",style: TextStyle(color: Colors.black),),)
          ],
        ),
      ),
    );
  }
}
