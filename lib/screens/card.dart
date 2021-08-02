import 'package:flutter/material.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_drawing/path_drawing.dart';

class CouponCard extends StatefulWidget {
  const CouponCard(this.coupon, this.colors);
  final myCoupons coupon;
  final List<Color> colors;


  @override
  _CouponCardState createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return CustomPaint(
      foregroundPainter: TimelinePainter(context, height * 0.04, width * 0.1),
      child: ClipPath(
        //clipper: DolDurmaClipper(height * 0.42, width * 0.1),
        child: Container(
          height: height * 0.2,
          //height: height * 0.19,
          width: width * 0.92,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.03),
              gradient: LinearGradient(
                stops: [0.3, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.colors,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.035, height * 0.01, width * 0.035, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.coupon.name ?? "Name",
                      style: TextStyle(fontSize: height * 0.023),
                    ),
                    //Image.network(src);
                    Image.network(
                      widget.coupon.image ?? "assets/images/Lego.png",
                      height: height * 0.03, //20,
                      width: width * 0.1, //40,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.coupon.shortDescription ?? "Offer to be added later",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.002, width * 0.05, 0),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.003, horizontal: width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Valid until ${widget.coupon.validUntill}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * 0.017,
                    color: Colors.red,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.04, width * 0.05, 0),
                child: Text(
                  "The coupon cannot be used in Airport branch, IFC mail branch and K11 MUSEA",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              // Center(
              //   child: Container(
              //     color: Colors.white,
              //     //height: width*0.6,
              //     width: width * 0.6,
              //     child: QrImage(
              //       data: "1234567890",
              //       version: QrVersions.auto,
              //       //size: width*0.6,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper(this.right, this.holeRadius);

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
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}

class TimelinePainter extends CustomPainter {
  TimelinePainter(
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

    final path1 = Path()
      ..moveTo(0.0, size.height - right - holeRadius)
      //..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - right),
        clockwise: true,
        radius: Radius.circular(1),
      );
    path1.close();
    var paint1 = Paint();
    paint1.color = Colors.white;
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 2;
    canvas.drawPath(path1, paint1);

    final path2 = Path()
      ..moveTo(size.width, size.height - right)
      //..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(size.width, size.height - right - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );
    path2.close();
    var paint2 = Paint();
    paint2.color = Colors.white;
    paint2.style = PaintingStyle.fill;
    paint2.strokeWidth = 2;
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter delegate) {
    return false;
  }
}