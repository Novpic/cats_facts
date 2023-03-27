import 'dart:convert';

class CatFact {
  int id;
  String text;
  CatFact({
    required this.id,
    required this.text,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFact.fromJson(String source) => CatFact.fromMap(json.decode(source));
}
