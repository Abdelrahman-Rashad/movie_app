import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieWidget extends StatelessWidget {
  final List<Movie> movies;

  MovieWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];

        return ListTile(
          leading: Image.network(movie.poster),
          title: Text(movie.title),
        );
      },
      itemCount: movies.length,
    );
  }
}
