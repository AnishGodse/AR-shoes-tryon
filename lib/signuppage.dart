import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauthentication/uihelper.dart';

import 'myhomepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email,String password)async{
    if(email=="" && password==""){
      uihelper.CustomAlertBox(context, "Enter required fields!");
    } else{
      UserCredential? usercredential;
      try{
        usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "HomePage")));
        });
      }
      on FirebaseAuthException catch(ex){
        return uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SignUp',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75,),
            Row(
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
              signUp(emailController.text.toString(), passwordController.text.toString());
            }, "SignUp"),
          ],
        ),
      ),
    );
  }
}
