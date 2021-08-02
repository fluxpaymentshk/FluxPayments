import 'package:flutter/material.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/screens/card.dart';
import 'package:flux_payments/screens/dialog_box_card.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox(this.coupon, this.colors);
  final myCoupons coupon;
  final List<Color> colors;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: height * 0.6,
          width: width ,
          child: DialogBoxCard(widget.coupon, widget.colors),
        ),
      );
  }
}
