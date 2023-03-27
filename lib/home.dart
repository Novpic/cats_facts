import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String catfact = 'Click button to generate new Cat Fact';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text(catfact,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black12),),
            ElevatedButton(
              onPressed: (){},
              child: Text('Fact'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent[100]),)
          ]
          ),
      ),
    );
  }
}