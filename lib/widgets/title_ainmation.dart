import 'package:flutter/material.dart';

class titelainmation extends StatelessWidget {
  final String text;
  titelainmation({this.text});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(text),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double val, Widget child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 20),
            child: child,
          ),
        );
      },
    );
  }
}
