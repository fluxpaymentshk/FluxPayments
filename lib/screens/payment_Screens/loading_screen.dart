import 'package:flutter/material.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          fluxLogo(context),
          Expanded(
              child: Container(
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/loading.svg'),
                Text(
                  "This will take a few minutes!\nWe are proceeding to the third party website.",
                  style: GoogleFonts.montserrat(fontSize: 15),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
