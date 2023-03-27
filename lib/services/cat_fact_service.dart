import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cats_facts/models/cat_Fact.dart';
class CatServiceFacts{
  String baseUrl = 'https://cat-fact.herokuapp.com';


  Future<CatFact> getCatFact()async {
    String endpoint = '/facts/random';
    final url = Uri.parse(baseUrl+endpoint);
    final response = await http
      .get(url);


    if(response.statusCode==200){
      return CatFact.fromJson(response.body);
    }else{
      return CatFact(id: 0,text: '');
    }
  }
}

final catServiceProvider = Provider((ref) => CatServiceFacts());