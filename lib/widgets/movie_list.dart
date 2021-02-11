import 'package:flutter/material.dart';

import '../models/movie.dart';
import './stars_rating.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  MoviesList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];

        return InkWell(
          onTap: () async {
            Navigator.pushNamed(context, '/movie', arguments: {
              'movie': movie,
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(movie.posterImagePath),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.4,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        StarsRating(movieRating: movie.rating),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          movie.releasedate,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13.0,
                              letterSpacing: 0.8),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}
