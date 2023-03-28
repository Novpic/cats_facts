import 'package:audioplayers/audioplayers.dart';
import 'package:cats_facts/services/cat_fact_service.dart';
import 'package:cats_facts/text_cat_fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  String catfact = 'Click button to generate new Cat Fact';
  AudioPlayer? player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player!.audioCache = AudioCache(prefix: '');
  }

  @override
  void dispose() {
    player!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catFactProvider = ref.watch(catServiceProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Cat Facts')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FutureBuilder(
              future: catFactProvider.getCatFact(),
              builder: (context, snapshot) {
                String text='';
                if (snapshot.hasData) {
                  text = snapshot.data!.text.length > 200
                          ? 'Press Again'
                          : snapshot.data!.text;
                  return TextCatFact(text:text);
                } else if (snapshot.hasError) {
                  text = 'Error Miau';
                  return TextCatFact(text:text);
                } else {
                  return CircularProgressIndicator();
                }
              }),
          Column(
            children: [
              Text(
                catfact,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black12),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () async {
                  await player!.play(AssetSource('audios/cat_meow.mp3'));
                  setState(() {});
                },
                child: Text('Fact'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent[100]),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
