import 'package:flutter/material.dart';

class ShoeDisp extends StatefulWidget {
  const ShoeDisp({super.key});

  @override
  State<ShoeDisp> createState() => _ShoeDispState();
}

class _ShoeDispState extends State<ShoeDisp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual Try-On",style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Color(0xff1597BB),
      ),
    );
  }
}
