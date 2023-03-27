import 'package:audioplayers/audioplayers.dart';
import 'package:cats_facts/services/cat_fact_service.dart';
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
    

  }
  @override
  Widget build(BuildContext context) {

    final catFactProvider = ref.watch(catServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            FutureBuilder(
              future: catFactProvider.getCatFact(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data!.text.length>200? 'Press Again': snapshot.data!.text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black12));
                }else if(snapshot.hasError){
                  return const Text('Error Miau',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black12));
                }else{
                  return CircularProgressIndicator();
                }

            }),
            Text(catfact,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black12),),
            ElevatedButton(
              onPressed: ()async {
                await player!.setSource(AssetSource('assets/cat_meow.wav'));
                await player!.resume();
                setState( () {
  
                });
              },
              child: Text('Fact'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent[100]),)
          ]
          ),
      ),
    );
  }
}