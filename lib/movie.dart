class Movies {
  Future<Movie> getMovie() => Future(() => Movie(
        thumbnail: "assets/finding-dory-thumbnail.jpg",
        poster: "assets/finding-dory-poster.png",
        year: "2016",
        genre: "Animation, Adventure",
        rating: 3,
        title: "Finding Dory",
        description:
            "The friendly but forgetful blue tang fish, Dory, begins a search" +
                " for her long-lost parents, and everyone learns a few things" +
                " about the real meaning of a family alowng the way. ",
        cast: "Ellen DeGeneres, Ty Burrell, Albert Brooks, Ed O'Neill",
        directors: "Andrew Stanton, Angus MacLane",
        similar: [
          "https://is2-ssl.mzstatic.com/image/thumb/Video1/v4/0b/27/d2/0b27d297-d2b9-a9cb-5553-de97e4e15d68/contsched.lxodtphu.png/460x0w.png",
          "https://is2-ssl.mzstatic.com/image/thumb/Video111/v4/9c/44/d6/9c44d6fd-df10-b702-65b1-d553c459201c/pr_source.lsr/460x0w.png",
          "https://is5-ssl.mzstatic.com/image/thumb/Video62/v4/cd/a6/a3/cda6a30f-c013-20da-ae5d-79ab91dcfb76/contsched.qtfsarzp.lsr/460x0w.jpg",
          "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/65/d9/77/65d977c5-23c0-8e35-90c9-364a07fe6a5c/contsched.zcpxjcwu.lsr/460x0w.jpg",
          "https://is5-ssl.mzstatic.com/image/thumb/Features62/v4/29/c3/0d/29c30dc8-5734-6db6-b21f-2183dd03d425/mza_6104744564377701302.jpg/460x0w.jpg",
          "https://is4-ssl.mzstatic.com/image/thumb/Video118/v4/1a/56/75/1a5675f0-0705-91b9-da49-71a3fe72d0da/contsched.zlfyhaku.lsr/460x0w.jpg",
          "https://is3-ssl.mzstatic.com/image/thumb/Video111/v4/5a/56/42/5a5642ce-7bdb-cbcc-f9d0-ec2782d05a60/pr_source.lsr/460x0w.png",
          "https://example.com/example.png"
        ],
      ));
}

class Movie {
  final String thumbnail;
  final String poster;
  final String year;
  final String genre;
  final int rating;
  final String title;
  final String description;
  final String cast;
  final String directors;
  final List<String> similar;

  const Movie(
      {this.thumbnail,
      this.poster,
      this.year,
      this.genre,
      this.rating,
      this.title,
      this.description,
      this.cast,
      this.directors,
      this.similar});

  static Movie fromJson(content) {
    return Movie(
      thumbnail: content["thumbnail"],
    );
  }
}
