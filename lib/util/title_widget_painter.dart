import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper({required this.height, required this.width, super.reclip});

  final double height;
  final double width;

  @override
  Path getClip(Size size) {
    final path = Path();
    path
      ..lineTo(0 * width, 1 * height)
      ..quadraticBezierTo(0.5 * width, 0.5 * height, 1 * width, 1 * height)
      ..lineTo(1 * width, 0 * height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
