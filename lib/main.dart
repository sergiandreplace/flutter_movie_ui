import 'package:flutter/material.dart';
import 'package:flutter_movie_ui/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie UI',
      theme: ThemeData(
        fontFamily: "Montserrat",
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
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
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
    return Row(
      children: <Widget>[
        Card(
          elevation: 8,
          child: Image.asset(
            movie.poster,
            height: 160,
          ),
        ),
        Expanded(
          child: MovieHeader(movie),
        ),
      ],
    );
  }
}

class MovieHeader extends StatelessWidget {
  const MovieHeader(this.movie, {Key key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${movie.year} · ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.indigoAccent,
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        Rating(3),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            movie.description,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }
}

class Rating extends StatelessWidget {
  final int rating;

  const Rating(this.rating, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Iterable.generate(
        5,
            (i) =>
            Icon(
              i < rating ? Icons.star : Icons.star_border,
              size: 24,
              color: Colors.yellow,
            ),
      ).toList(),
    );
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
