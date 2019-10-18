import 'dart:ui' as ui;

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
      home: MoviePage(),
    );
  }
}

class MoviePage extends StatefulWidget {
  final movies = Movies();

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool isLoaded = false;
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: isLoaded ? MovieSections(movie: movie) : Loader(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.movies.getMovie().then((value) {
      setState(() {
        movie = value;
        isLoaded = true;
      });
    });
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Loading..."),
      ),
    );
  }
}

class MovieSections extends StatelessWidget {
  const MovieSections({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MovieThumbnail(movie.thumbnail),
        MovieHeaderWithPoster(movie),
        HorizontalLine(),
        MoviePeople(movie),
        MovieFeedback(),
        HorizontalLine(),
        MovieSuggestions(movie.similar),
      ],
    );
  }
}

class MovieThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieThumbnail(this.thumbnail, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Image.asset(thumbnail),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieHeaderWithPoster(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(movie.poster),
          SizedBox(width: 16),
          Expanded(
            child: MovieHeader(movie),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster(this.poster, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: 8,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          poster,
          height: 160,
        ),
      ),
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
          child: Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              children: <TextSpan>[
                TextSpan(
                  text: movie.description,
                ),
                TextSpan(
                  text: "More...",
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ],
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
        (i) => ShaderMask(
          shaderCallback: shader,
          child: Icon(
            i < rating ? Icons.star : Icons.star_border,
            size: 24,
            color: Colors.yellow,
          ),
        ),
      ).toList(),
    );
  }

  ui.Shader shader(Rect rect) => ui.Gradient.linear(
        Offset(0, 0),
        Offset(0, rect.height),
        [Colors.yellowAccent, Colors.orange],
      );
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.black12,
      ),
    );
  }
}

class MoviePeople extends StatelessWidget {
  final Movie movie;

  const MoviePeople(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField("Cast", movie.cast),
          MovieField("Directors", movie.directors),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  MovieField(this.field, this.value, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$field: ",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.w300)),
          Expanded(
              child: Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
          ))
        ],
      ),
    );
  }
}

class MovieFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FeedbackButton(Icons.add, "My List"),
          FeedbackButton(Icons.thumb_up, "Rate"),
          FeedbackButton(Icons.share, "Share"),
        ],
      ),
    );
  }
}

class FeedbackButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeedbackButton(this.icon, this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 32,
              color: Colors.black54,
            ),
          ),
          Text(text, style: TextStyle(fontSize: 14, color: Colors.black38))
        ],
      ),
    );
  }
}

class MovieSuggestions extends StatelessWidget {
  final List<String> suggestions;

  const MovieSuggestions(this.suggestions, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Similar like this".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: suggestions.length,
            padding: EdgeInsets.symmetric(horizontal: 12),
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                  width: 114,
                  color: Colors.black12,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Icon(Icons.image, color: Colors.white, size: 30),
                      Image.network(
                        suggestions[index],
                      ),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }
}
