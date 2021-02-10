import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;

  MovieHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BoxShadowPainter(),
      child: ClipPath(
        clipper: MyClipper(), //my CustomClipper
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(movie.backdropImagePath),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height - 85); // more than myclipper by 5
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 85); // more than myclipper by 5
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawShadow(path, Colors.black45, 25.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
