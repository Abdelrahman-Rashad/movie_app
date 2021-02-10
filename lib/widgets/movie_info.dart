import 'package:flutter/material.dart';

import '../models/movie.dart';
import './movie_header.dart';

class MovieInfo extends StatefulWidget {
  //final Movie movie;

  //MovieInfo(this.movie);
  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieHeader(), //widget.movie),
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
              'movie title',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'movie genres',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
