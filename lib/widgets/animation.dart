import 'package:flutter/material.dart';

class CustomAnimation extends StatelessWidget {
  final Widget widget;
  CustomAnimation({this.widget});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: widget,
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double val, Widget child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 15, right: val * 10),
            child: child,
          ),
        );
      },
    );
  }
}
