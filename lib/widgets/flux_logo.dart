import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget fluxLogo(BuildContext context) {
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
  return Align(
    alignment: Alignment.center,
    child: Text(
      "Flux.",
      style: GoogleFonts.montserrat(
        fontSize: MediaQuery.of(context).size.height * 0.07,
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = linearGradientText,
        // textStyle:
        //     TextStyle(color: Colors.blue, letterSpacing: .5),
      ),
    ),
  );
}
