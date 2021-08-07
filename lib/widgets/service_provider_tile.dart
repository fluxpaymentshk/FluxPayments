import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class serviceProviderTile extends StatelessWidget {
  final String name,  imageurl;
  //final double amount;
  serviceProviderTile(
      {required this.name,
    //  required this.paidOn,
      required this.imageurl,
     // required this.amount,
      Key? key})
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
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.symmetric(vertical:SizeConfig.heightMultiplier * 1,horizontal:SizeConfig.widthMultiplier*3,),
     // margin: EdgeInsets.all(SizeConfig.heightMultiplier * 0.6),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 2)),
        // border: Border.all(color: AppTheme.main, width: 1.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.3),
            child:
             Container(
              height: SizeConfig.heightMultiplier*4,
              width: SizeConfig.widthMultiplier*10,

            
              child : Image.network(imageurl,fit:BoxFit.cover),
              //  child:NetworkImage(state.user.);
            ),
            // CircleAvatar(
            //     backgroundImage: NetworkImage(img),
            //     // SvgPicture.asset(
            //     //   img,
            //     //   //alignment: Alignment.center,
            //     //   height: height * 0.06,
            //     //   color: AppTheme.main,
            //     //   fit: BoxFit.scaleDown,
            //     // ),
            //     backgroundColor: AppTheme.offWhite,
            //     radius: height * 0.04,
            //   ),
          ),
          // SizedBox(
          //   width: SizeConfig.widthMultiplier * 4,
          // ),
           Spacer(flex: 2,),
          Center(
            child: Text(
              //'HSBC',
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                )),
          ),
         Spacer(flex:5,),
          // Text('-500',
          //     //amount
          //     style: TextStyle(
          //       fontSize: 15,
          //       color: AppTheme.red,
          //       fontWeight: FontWeight.w500,
          //     )),
        ],
      ),
    );
  }
}
