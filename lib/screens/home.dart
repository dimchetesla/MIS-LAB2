import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../screens/random_joke_screen.dart';
import '../widgets/joke_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiServices.JokeTypes().then((response) {
      setState(() {
        jokeTypes = response;
      });
    }).catchError((error) {
      print("Error fetching joke types: $error");
    });
  }

  void navigateToRandomJoke(BuildContext context) async {
    try {
      final randomJoke = await ApiServices.RandomJoke();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RandomJokeScreen(joke: randomJoke),
        ),
      );
    } catch (error) {
      print("Error fetching random joke: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes App 215071"),
        actions: [
          IconButton(
            icon: const Text(
              "😂",
              style: TextStyle(fontSize: 24),
            ),
            tooltip: "Random Joke",
            onPressed: () => navigateToRandomJoke(context),
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : JokeGrid(jokeTypes: jokeTypes),
    );
  }
}

