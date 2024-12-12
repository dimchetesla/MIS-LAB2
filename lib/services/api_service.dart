import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class ApiServices {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  static Future<List<String>> JokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types!');
    }
  }

  static Future<Joke> RandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke!');
    }
  }

  static Future<List<Joke>> JokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes!');
    }
  }
}

