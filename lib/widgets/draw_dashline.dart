import 'package:path_drawing/path_drawing.dart';
import 'package:flutter/material.dart';

class DashLineDrawer extends CustomPainter {
  DashLineDrawer(
    this.context,
    this.right,
    this.holeRadius,
  );
  final right;
  final holeRadius;
  BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    // print('size of canvas= h${size.height} & w${size.width}');
    var path = Path();

    path.moveTo(
        holeRadius / 2, size.height - right - holeRadius + holeRadius / 2);
    path.lineTo(size.width - holeRadius / 2,
        size.height - right - holeRadius + holeRadius / 2);

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([15.0, 7.0])), paint);
  }

  @override
  bool shouldRepaint(CustomPainter delegate) {
    return false;
  }
}
