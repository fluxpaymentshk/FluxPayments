import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  CircleClipper(this.right, this.holeRadius);

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - right),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - right)
      ..arcToPoint(
        Offset(size.width, size.height - right - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) => true;
}
