import 'package:flutter/material.dart';


ThemeData theme (){
  return  ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.pinkAccent[100],
      secondary: Colors.pinkAccent[150],
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color.fromARGB(255, 222, 191, 228))),
  );
}