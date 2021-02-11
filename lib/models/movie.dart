class Movie {
  final int id;
  final String posterImagePath;
  final String title;
  final String year;
  final String backdropImagePath;
  final String rating;
  final String originalLanguage;
  final String releasedate;
  final List genreIdList;
  final String overview;
  static Map<int, String> genres;

  //the api have specific configuration for the images url more: https://developers.themoviedb.org/3/configuration/get-api-configuration
  static final String tempBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  Movie(
      {this.id,
      this.posterImagePath,
      this.title,
      this.year,
      this.backdropImagePath,
      this.rating,
      this.originalLanguage,
      this.releasedate,
      this.genreIdList,
      this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      posterImagePath: tempBaseUrl + json['poster_path'],
      backdropImagePath: tempBaseUrl + json['backdrop_path'],
      title: json['title'],
      year: json['release_date'],
      rating: json['vote_average'].toString(),
      originalLanguage: json['original_language'],
      releasedate: json['release_date'],
      genreIdList: json['genre_ids'],
      overview: json['overview'],
    );
  }

  String getMovieGenres() {
    String movieGenres = '';
    var list = genreIdList;
    print(genres);
    list.forEach((element) {
      movieGenres += (genres[element].toString() + ', ');
    });
    return movieGenres.substring(0, movieGenres.length - 2);
  }
}
