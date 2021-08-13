import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class PendingPaymentTile extends StatelessWidget {
  final double amount;
  final int serviceProviders;
  const PendingPaymentTile(
      {required this.amount, required this.serviceProviders, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
      height: SizeConfig.heightMultiplier * 7.5,
      width: SizeConfig.widthMultiplier * 92,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 1)),
        border: Border.all(color: AppTheme.red),
        color: Color(0xffFFECEC),
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 80,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
              child: Text(
                'Pending $amount payments from $serviceProviders providers',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //Spacer(),
          Container(
            margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
            //  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier*2),
            child: Image.asset(
              "assets/images/arrow.png",
              height: SizeConfig.heightMultiplier * 7,
              width: SizeConfig.widthMultiplier * 9,
              //    fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
