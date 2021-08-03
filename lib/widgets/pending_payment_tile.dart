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
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          height: SizeConfig.heightMultiplier * 7.5,
          width: SizeConfig.widthMultiplier * 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.heightMultiplier * 1)),
            border: Border.all(color: AppTheme.red),
            color: Color(0xffFFECEC),
          ),
          child: Row(
            children: [
              Container(
                width: SizeConfig.widthMultiplier * 80,
                child: Padding(
                  padding: EdgeInsets.only(left: 9.0),
                  child: Text(
                    'Pending $amount payments from $serviceProviders providers',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Image.asset(
                  "assets/images/arrow.png",
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.widthMultiplier * 9,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
