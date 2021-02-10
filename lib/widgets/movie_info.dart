import 'package:flutter/material.dart';

import '../models/movie.dart';
import './movie_header.dart';

class MovieInfo extends StatefulWidget {
  final Movie movie;

  MovieInfo(this.movie);
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
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
    return Stack(
      children: [
        MovieHeader(widget.movie),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 235,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  elevation: 0.5,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              widget.movie.title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'movie genres',
              style: description,
            ),
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
                        widget.movie.year.substring(0, 4),
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
                        widget.movie.originalLanguage.replaceRange(0, 1,
                            widget.movie.originalLanguage[0].toUpperCase()),
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
                        widget.movie.rating.toString() + '/10',
                        style: info,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
