import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final VoidCallback onTap;

  const JokeCard({super.key, required this.jokeType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(jokeType, style: TextStyle(fontSize: 18))),
        ),
      ),
    );
  }
}

