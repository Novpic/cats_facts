import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextCatFact extends StatefulWidget {
  final String text;
  const TextCatFact({super.key, required this.text});

  @override
  State<TextCatFact> createState() => _TextCatFactState();
}

class _TextCatFactState extends State<TextCatFact> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width/3,
      child: AnimatedTextKit(
      animatedTexts: [
      WavyAnimatedText(
        widget.text,
        textStyle: TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
      ),
      ],
    ),
    );
  }
}