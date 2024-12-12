class Joke {
  final String setup;
  final String punchline;
  final String id;

  Joke({required this.setup, required this.punchline, required this.id});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'] ?? '',
      punchline: json['punchline'] ?? '',
      id: json['id'].toString() ?? '',
    );
  }
}
