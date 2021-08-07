import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

Widget gradientButton(BuildContext context, String value) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      border: Border.all(color: AppTheme.main),
      gradient: RadialGradient(
        center: Alignment(0.6, 0.5),
        colors: [
          Color(0xffB772EE),
          Color(0xff7041EE),
        ],
        radius: 2.5,
      ),
    ),
    child: Center(
      child: Text(
        value,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          // height: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}
