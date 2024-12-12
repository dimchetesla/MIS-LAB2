import 'package:flutter/material.dart';
import 'joke_card.dart';

class JokeGrid extends StatelessWidget {
  final List<String> jokeTypes;

  const JokeGrid({super.key, required this.jokeTypes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: jokeTypes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final jokeType = jokeTypes[index];
        return JokeCard(
          jokeType: jokeType,
          onTap: () {
            Navigator.pushNamed(
              context,
              '/joke_details',
              arguments: jokeType,
            );
          },
        );
      },
    );
  }
}
