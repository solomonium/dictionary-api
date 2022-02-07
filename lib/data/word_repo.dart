import 'dart:convert';

import 'package:dictionary_app/data/model.dart';
import 'package:http/http.dart' as http;

abstract class WordRepo {
  Future<WordResponse> getMeaning(String word);
}

class WordRepoImpl implements WordRepo {
  @override
  Future<WordResponse> getMeaning(String word) async {
    final response = await http.get(
        Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/$word"));
    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final Map<String, dynamic> data = {
        "definition": jsonMap[0]["meanings"][0]["definitions"][0]["definition"],
      };
      WordResponse wordResponse = WordResponse.fromJson(data);
      print('Yes + $wordResponse');
      return wordResponse;
    } else {
      throw Exception();
    }
  }
}
