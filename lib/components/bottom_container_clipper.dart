import 'package:flutter/material.dart';

class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0, height);
    path.lineTo(0, 70);
    path.quadraticBezierTo(width * 0.25, 0, width * 0.5, 0);
    path.quadraticBezierTo(width * 0.75, 0, width, 70);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}