import 'package:firebaseauthentication/reco.dart';
import 'package:firebaseauthentication/reco1.dart';
import 'package:firebaseauthentication/virtryonupdate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebaseauthentication/virtryonupdate.dart';

class Clicktryonpage1 extends StatelessWidget {

  var selected;
  var id;
  Clicktryonpage1({required this.selected,required this.id});

  final snapchat_urls = [
    'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB',
    'https://lens.snapchat.com/5f8ef5e0aae94cb08593385483380143?share_id=0A-hipzMDi0&locale=en-GB',
    'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=a318365373754c02a70b3f4711b81ef8&metadata=01',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          SizedBox(
            height: 175,
            width: 175,
            child: Image(image: AssetImage(
                'assets/shoe' + (selected).toString() + '.png')),
          ),
          const Text("Click here to try out the shoe!"),
          const SizedBox(height: 20,),
          Center(
            child: OutlinedButton(
              child: const Text('Try AR filter'),
              onPressed: () {
                _launchURL(snapchat_urls[selected - 1]);
              },
            ),
          ),
          const SizedBox(height: 15,),
          Center(
            child: OutlinedButton(
              child: const Text('Recommendations'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Reco1(selected: selected, id: id,)));
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}