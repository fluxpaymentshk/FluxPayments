import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class recentPaymentTile extends StatelessWidget {
  final String name, paidOn, imageurl;
  final double amount;
  recentPaymentTile(
      {required this.name, required this.paidOn,required this.imageurl,required this.amount, Key? key})
      : super(key: key);
 
  final List<List<Color>> colors = [
    [
      Color(0xff5a3f78),
      Color(0xffec7174),
    ],
    [
      Color(0xffddaa5d),
      Color(0xff55bfe0),
    ],
    [
      Color(0xff53de93),
      Color(0xfff4afe1),
    ],
    [
      Color(0xffbb59c4),
      Color(0xff0ee5fb),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    //  const height=SizeConfig.heightMultiplier;
    return Container(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1,),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * 0.6),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 2)),
        border: Border.all(color: AppTheme.main, width: 1.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.6),
            child: Container(
              // height: SizeConfig.heightMultiplier*12,
              // width: SizeConfig.widthMultiplier*100,

              child: Image.asset(
                "assets/images/av.png",
                scale: 0.3,
              ),
              //child : Image.network(imageurl),
              //  child:NetworkImage(state.user.);
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 4,
          ),
          Column(
            children: [
              Text('HSBC',
                  //name
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  )),
              Text('paidOn',
                  //paidOn
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  )),
            ],
          ),
          Spacer(),
          Text('-500',
              //amount
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.red,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
