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
          backgroundColor:Colors.white,
      body: Container(
          height:MediaQuery.of(context).size.height*1,
          margin:EdgeInsets.only(top:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            fluxLogo(context),
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    //             Stack(children: [
    // Container(
    //     width: 200,
    //     height: 200,
    //     child: SvgPicture.asset(
    //      'assets/icons/loading.svg',
    //       fit: BoxFit.cover,
    //     ),),],),
                  Image.asset("assets/icons/loader.png"),
                  Container(
                    child: Text(
                      "This will take a few minutes!\nWe are proceeding to the third party website.",
                      textAlign:TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
