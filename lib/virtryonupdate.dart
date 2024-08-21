import 'package:firebaseauthentication/clicktryonpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

import 'clicktryonpage1.dart';
import 'clicktryonpage2.dart';

class VirtualTryOnPage extends StatefulWidget {
  @override
  State<VirtualTryOnPage> createState() => _VirtualTryOnPageState();
}

class _VirtualTryOnPageState extends State<VirtualTryOnPage> {
  @override
  var selected = 1;
  var id = 18653;

  final snapchat_urls = [
    'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB',
    'https://lens.snapchat.com/5f8ef5e0aae94cb08593385483380143?share_id=0A-hipzMDi0&locale=en-GB',
    'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=a318365373754c02a70b3f4711b81ef8&metadata=01',
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Guide to using the module'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Step 1:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Use the bottom list to navigate through the available shoe options.'),
                  SizedBox(height: 8.0),
                  Text('Step 2:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'You can make use of the AR virtual try on feature by clicking on the "Try AR filter" button'),
                  SizedBox(height: 8.0),
                  Text('Step 3:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Once desired shoe is selected, you can proceed by clicking on the button on the app bar.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Virtual try on'),
        actions: [
          Center(
            child: Row(
              children: [
                TextButton(
                  onPressed: _showMyDialog,
                  child: const Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  selected = 1;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage(selected: selected,id: id)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (1).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Nike Air Jordans Sports",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Sports Shoes',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('4.5'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 13,999',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selected = 2;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage1(selected: selected,id: id)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (2).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Leather formal wear",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Luxury Shoes',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('3.9'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 8,599',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selected = 3;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage2(selected: selected,id: 18653)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (3).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Nike Casual Slippers",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Flipflops',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('4.9'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 1,999',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selected = 1;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage(selected: selected,id: id)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (1).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Nike Air Jordans Sports",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Sports Shoes',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('4.5'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 13,999',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selected = 2;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage1(selected: selected,id: id)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (2).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Leather formal wear",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Luxury Shoes',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('3.9'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 8,599',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  selected = 3;
                  id = 18653;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Clicktryonpage2(selected: selected,id: id)));
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Clicktryonpage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 175,
                      width: 175,
                      child: Image(image: AssetImage(
                          'assets/shoe' + (3).toString() + '.png')),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        const Text("Sponsored"),
                        const Text("Nike Casual Slippers",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 45,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blueGrey[300],
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: const Text(
                                'Flipflops',
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('4.9'),
                            SizedBox(width: 5,),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image(image: AssetImage(
                                  'assets/stars.png')),
                            ),
                          ],
                        ),
                        const Text('M.R.P : 1,999',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
