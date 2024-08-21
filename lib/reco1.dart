import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'clicktryonpage.dart';
import 'myhomepage.dart';

class Reco1 extends StatelessWidget {
  const Reco1({Key? key, required selected, required id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter flask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(id: '4179'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String id; // Define id as a parameter in the constructor

  HomePage({required this.id}); // Pass id through constructor

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  String finalResponse = "";

  OutlineInputBorder _inputFormDeco() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
    );
  }

  @override
  void initState() {
    super.initState();
    name = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Recommendations'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')));
          },
        ),
      ),

      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('http://10.0.2.2:5000/name');
                final response = await http.post(url, body: json.encode({'name': name}));
              },
              child: const Text('SEND'),
            ),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('http://10.0.2.2:5000/name');
                final response = await http.get(url);
                final decoded = json.decode(response.body) as Map<String, dynamic>;
                setState(() {
                  finalResponse = decoded['name'];
                  // Load image here
                  // Check if finalResponse is not empty before loading image
                  // Assuming the image is always in 'assets' folder
                  // Adjust path if it's different
                  if(finalResponse.isNotEmpty) {
                    AssetImage assetImage = AssetImage('assets/${finalResponse.trim()}.jpg');
                    precacheImage(assetImage, context); // Precache the image to avoid flickering
                  }
                });
              },
              child: const Text('GET'),
            ),
            // Display the image based on finalResponse
            if(finalResponse.isNotEmpty)
              Container(
                height: 450,
                width: 450,
                child: Image(image: AssetImage('assets/${finalResponse.trim()}.jpg')),
              ),
          ],
        ),
      ),
    );
  }
}
