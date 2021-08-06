   import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';

Widget subheading(String name)
   {
   return Container(
              height: SizeConfig.heightMultiplier * 9,
              width: SizeConfig.widthMultiplier * 97,
              //  decoration: BoxDecoration(color: AppTheme.main),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 1,
                        vertical: SizeConfig.heightMultiplier * 0.2),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
            }