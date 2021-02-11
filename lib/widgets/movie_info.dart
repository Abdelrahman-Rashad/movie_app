import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/widgets/stars_rating.dart';

import '../models/movie.dart';
import './movie_header.dart';

class MovieInfo extends StatefulWidget {
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  Map data = {}; //the data passed from home (movie)

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    final Movie movie = data['movie'];

    TextStyle description = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      letterSpacing: 0.5,
    );
    TextStyle info = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.7,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            MovieHeader(movie),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 235,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FloatingActionButton(
                      elevation: 0.5,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.amber,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  movie.getMovieGenres(),
                  style: description,
                ),
                SizedBox(height: 20),
                StarsRating(movieRating: movie.rating),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Year',
                            style: description,
                          ),
                          Text(
                            movie.year.substring(0, 4),
                            style: info,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Language',
                            style: description,
                          ),
                          Text(
                            movie.originalLanguage.replaceRange(
                                0, 1, movie.originalLanguage[0].toUpperCase()),
                            style: info,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Rating',
                            style: description,
                          ),
                          Text(
                            movie.rating.toString() + '/10',
                            style: info,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 26,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          movie.overview,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            wordSpacing: 0.7,
                            letterSpacing: 0.3,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
