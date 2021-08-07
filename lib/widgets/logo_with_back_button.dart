import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/widgets/flux_logo.dart';

Widget logoWithBackButton(BuildContext context) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 2,
                horizontal: SizeConfig.heightMultiplier * 1),
            // color: Colors.amber,
            // height: SizeConfig.heightMultiplier*12,
            // width: SizeConfig.widthMultiplier*100,

            child: Image.asset(
              "assets/icons/backButton.png",
              scale: 1.6,
            ),
            //  child:NetworkImage(widget.user.);
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      Column(
        children: [
          SizedBox(
            //color: Colors.amber,
            height: SizeConfig.heightMultiplier * 2.4,
            //   child:
          ),
          Container(
            height: SizeConfig.heightMultiplier * 12,
            width: SizeConfig.widthMultiplier * 100,
            child: Center(
              //  child: Image.asset("assets/images/logo.png"),
              child: fluxLogo(context),
            ),
          ),
        ],
      ),
    ],
  );
}
