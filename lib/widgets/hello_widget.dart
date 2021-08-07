import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

Widget helloWidget(String userName, BuildContext context) {
  return FittedBox(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 16),
      //  decoration: BoxDecoration(color: AppTheme.main),
      child: Row(
        children: [
          Padding(
                            padding:EdgeInsets.all(SizeConfig.heightMultiplier*2),
                            child: Center(
                              child: Container(
                                width: SizeConfig.widthMultiplier * 60,
                                height: SizeConfig.heightMultiplier * 10,
                                child: FittedBox(
                                  child: Text(
                                    'Hello $userName!',
                                    style: AppTheme.display1,
                                  ),
                                ),
                              ),
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
    ),
  );
}
