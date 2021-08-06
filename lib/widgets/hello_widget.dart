import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

Widget helloWidget(String userName, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    width: MediaQuery.of(context).size.width * 0.5,
    padding: EdgeInsets.symmetric(horizontal: 16),
    //  decoration: BoxDecoration(color: AppTheme.main),
    child: Row(
      children: [
        Text(
          'Hello $userName!',
          style: GoogleFonts.montserrat(
            fontSize: 25,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            // height: SizeConfig.heightMultiplier*12,
            // width: SizeConfig.widthMultiplier*100,

            child: Image.asset("assets/images/av.png"),
            //  child:NetworkImage(state.user.);
          ),
        ),
      ],
    ),
  );
}
