import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../models/movie.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  MoviesList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];

        return ListTile(
          /*leading: Image.network(movie.posterImagePath),
          title: Text(movie.title),
          */
          onTap: () async {
            Navigator.pushNamed(context, '/movie', arguments: {
              'movie': movie,
            });
          },
          title: Row(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  child: Image.network(movie.posterImagePath),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 0.4),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SmoothStarRating(
                      color: Colors.amber,
                      size: 15.0,
                      starCount: 5,
                      rating: (double.parse(movie.rating) / 2),
                      spacing: 5.0,
                      allowHalfRating: true,
                      borderColor: Colors.yellow[800],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      movie.releasedate,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 10.0,
                          letterSpacing: 0.8),
                    )
                  ],
                ),
              ))
            ],
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}
