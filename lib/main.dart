import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie UI',
      theme: ThemeData(
      ),
      home: MoviePage(),
    );
  }
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

