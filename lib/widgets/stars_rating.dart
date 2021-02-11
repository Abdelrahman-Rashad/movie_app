import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarsRating extends StatelessWidget {
  StarsRating({@required this.movieRating});

  final String movieRating;

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      isReadOnly: true,
      color: Colors.amber[600],
      size: 20.0,
      starCount: 5,
      rating: (double.parse(movieRating) / 2),
      spacing: 5.0,
      allowHalfRating: true,
      borderColor: Colors.yellow[800],
    );
  }
}
