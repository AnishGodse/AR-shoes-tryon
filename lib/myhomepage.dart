// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthentication/shoedisp.dart';
import 'package:firebaseauthentication/virtryonupdate.dart';
import 'package:firebaseauthentication/virtualtryonpage.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  logOut() async {
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA3C7D6),
      appBar: AppBar(
        title: const Text("Virtual Try-On",style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Color(0xff1597BB),
        actions: [FloatingActionButton(
          onPressed: logOut,
          child: const Icon(Icons.logout_outlined),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Text("A new and\nimproved",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),),
                  Text("shopping",style: TextStyle(fontSize: 55,color: Colors.redAccent,fontWeight: FontWeight.bold),),
                  Text("experience.",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),),
                  SizedBox(height: 150,),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VirtualTryOnPage()));
                    },style: ElevatedButton.styleFrom(
                      //background color of button
                        side: BorderSide(width:3, color:Colors.transparent), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.all(20) //content padding inside button
                    ), child: Text("Shop Now",style: TextStyle(color: Colors.black),), // Set the width and height as per your requirement
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
