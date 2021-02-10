class Movie {
  final int id;
  final String poster;
  final String title;
  final String year;
  //the api have specific configuration for the images url more: https://developers.themoviedb.org/3/configuration/get-api-configuration
  static final String tempBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  Movie({this.id, this.poster, this.title, this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      poster: tempBaseUrl + json['poster_path'],
      title: json['original_title'],
      year: json['release_date'],
    );
  }
}
