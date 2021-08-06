import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

Widget appTextField({required String text,required  double height, required double width,
    required TextEditingController mycontroller}) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2.2,
            horizontal: SizeConfig.widthMultiplier * 4.2,
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppTheme.main,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.heightMultiplier * 0.2,
            bottom: SizeConfig.heightMultiplier * 2.2,
            left: SizeConfig.widthMultiplier * 4.2,
            right:SizeConfig.widthMultiplier * 4.2,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2),
                // width: SizeConfig.widthMultiplier * 60,
                // height: SizeConfig.heightMultiplier * 6,
                width:width,
                height:height,
                decoration: BoxDecoration(
                  // boxShadow:
                  //       //kElevationToShadow[4],
                  //       [
                  //     BoxShadow(
                  //      // color: Colors.grey.shade500,
                  //       color:AppTheme.white,
                  //       blurRadius: SizeConfig.widthMultiplier * 0.5,
                  //       spreadRadius: SizeConfig.widthMultiplier * 0.05,
                  //       offset: Offset(SizeConfig.widthMultiplier * 0.7,
                  //           SizeConfig.heightMultiplier * 0.5),
                  //     ),
                  //   ],
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.heightMultiplier * 1.1)),
                  border: Border.all(color: AppTheme.main, width: 1.0),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide:BorderSide.none),
                    // focusColor: AppTheme.main,
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: AppTheme.main),
                    // ),
                  ),
                  controller: mycontroller,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
