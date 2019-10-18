import 'dart:convert';

import 'package:flutter_movie_ui/movie.dart';
import 'package:http/http.dart';

Future<Movie> getArticlesFromIssue(String issueFile) async {
  Response response = await get('https://json.flutterweekly.net/$issueFile',
      headers: {"Accept-Charset": "utf-8"});
  var content = json.decode(response.body);
  return Movie.fromJson(content);
}
