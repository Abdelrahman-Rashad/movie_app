class Movie {
  final int id;
  final String posterImagePath;
  final String title;
  final String year;
  final String backdropImagePath;
  final String rating;
  final String originalLanguage;
  //the api have specific configuration for the images url more: https://developers.themoviedb.org/3/configuration/get-api-configuration
  static final String tempBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  Movie({
    this.id,
    this.posterImagePath,
    this.title,
    this.year,
    this.backdropImagePath,
    this.rating,
    this.originalLanguage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      posterImagePath: tempBaseUrl + json['poster_path'],
      backdropImagePath: tempBaseUrl + json['backdrop_path'],
      title: json['original_title'],
      year: json['release_date'],
      rating: json['vote_average'].toString(),
      originalLanguage: json['original_language'],
    );
  }
}
