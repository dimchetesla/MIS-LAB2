import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '/models/joke_model.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Joke> jokes = [];
  String jokeType = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    jokeType = arguments;
    getJokesForType(jokeType);
  }

  void getJokesForType(String type) async {
    ApiServices.JokesByType(type).then((jokesList) {
      setState(() {
        jokes = jokesList;
      });
    }).catchError((error) {
      print("Error fetching jokes: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Type of Jokes: $jokeType')),
      body: jokes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return ListTile(
            title: Text(joke.setup),
            subtitle: Text(joke.punchline),
          );
        },
      ),
    );
  }
}
