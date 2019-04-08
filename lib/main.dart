import 'package:flutter/material.dart';
import 'package:flutter_movie_ui/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie UI',
      theme: ThemeData(
      ),
      home: MoviePage(Movies.getMovie()),
    );
  }
}

class MoviePage extends StatelessWidget {
  final Movie movie;

  const MoviePage(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MovieThumbnail(movie.thumbnail),
          MovieHeaderWithPoster(movie),
          HorizontalLine(),
          MoviePeople(movie),
          MovieFeedback(),
          HorizontalLine(),
          MovieSuggestions(movie.similar),
        ],
      ),
    );
  }
}

class MovieThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieThumbnail(this.thumbnail, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MovieHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieHeaderWithPoster(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MoviePeople extends StatelessWidget {
  final Movie movie;

  const MoviePeople(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MovieFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MovieSuggestions extends StatelessWidget {
  final List<String> suggestions;

  const MovieSuggestions(this.suggestions, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





