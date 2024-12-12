import 'package:flutter/material.dart';
import '../screens/details.dart';
import '../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '215071-App-for-Jokes',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/joke_details': (context) => const Details(),
      },
    );
  }
}
