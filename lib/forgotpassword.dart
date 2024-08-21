import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthentication/uihelper.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();
  forgotpassword(String email) async{
    if(email==""){
      return uihelper.CustomAlertBox(context, "Enter an email to reset password!");
    }
    else{
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        // Email sent successfully
        // You can inform the user here if needed
      } catch (e) {
        // Error sending email
        print("Error sending password reset email: $e");
        // You can inform the user about the error using a dialog or other means
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Forgot password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uihelper.CustomTextField(emailcontroller, "Email", Icons.mail_outline_sharp, false),
            const SizedBox(height: 10,),
            uihelper.customButton(() {
              forgotpassword(emailcontroller.text.toString());
            }, "Reset password")
          ],
        ),
      ),
    );
  }
}
