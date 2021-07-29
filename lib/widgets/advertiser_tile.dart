import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class advertiserTile extends StatelessWidget {
  advertiserTile(
      {required this.i, required this.imageurl, required this.desc, Key? key})
      : super(key: key);
  final int i;
  final String imageurl, desc;
  final List<List<Color>> colors = [
    // [
    //   Color(0xff5a3f78),
    //   Color(0xffec7174),
    // ],
    [
      Color(0xffdcb739),
      Color(0xff4cc47e),
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
      height: SizeConfig.heightMultiplier * 18,
      width: SizeConfig.widthMultiplier * 85,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 2)),
//color: Colors.red,
        //   color: AppTheme.brownishPink,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: SizeConfig.heightMultiplier * 90 / 100,
            right: SizeConfig.heightMultiplier * 120 * 5 / 100,
            left: SizeConfig.heightMultiplier * 90 * 2 / 100,
            child: Container(
              //      height: SizeConfig.heightMultiplier * 22,
              //        width: SizeConfig.widthMultiplier * 90,
              //       height: SizeConfig.heightMultiplier * 12,
              //  width: SizeConfig.widthMultiplier * 10,
              decoration: BoxDecoration(
                  // color: Colors.purple[200],
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.heightMultiplier * 2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.4,
                    ),
                  ],
                  gradient: LinearGradient(
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                      colors: colors[i % 3])),

              child:
                  //   Container(color: Colors.amber,height: 10,),
                  Container(
                margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 18),
                width: SizeConfig.widthMultiplier * 10,
                height: SizeConfig.heightMultiplier * 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.heightMultiplier * 2)),

                  //  color: AppTheme.brownishPink,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.7, left: 4.2, right: 4.2),
                        child: Container(
                          child: Text(
                            //'3X point when redeem point on your Birthday month',
                            desc,
                            style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Spacer(),

          Positioned.fill(
            bottom: SizeConfig.heightMultiplier * 1.8 * 90 / 100,
            left: SizeConfig.widthMultiplier * 50,
            //left:180,
            child:
                //Image.asset("assets/images/wallet.png"),
                Image.network(imageurl),
          ),
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(7.0),
    //   child: Container(
    //     height: SizeConfig.heightMultiplier * 13,
    //     width: SizeConfig.widthMultiplier * 80,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(
    //             Radius.circular(SizeConfig.heightMultiplier * 2)),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey,
    //             blurRadius: 3.0,
    //           ),
    //         ],
    //         //   color:Colors.black,
    //         gradient: LinearGradient(
    //             end: Alignment.topLeft,
    //             begin: Alignment.bottomRight,
    //             colors: colors[0])),
    //     child: Stack(
    //       children: [
    //         //  SizedBox(height:SizeConfig.heightMultiplier * 2,),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8.7, left: 4.2,right:4.2),
    //           child: Container(
    //             child: Text(
    //               '3X point when redeem point on your Birthday month',
    //           //  desc,
    //               style: TextStyle(
    //                 color: AppTheme.white,
    //                 fontSize: 15,
    //               ),
    //             ),
    //           ),
    //         ),
    //         // Positioned.fill(
    //         //   top: SizeConfig.heightMultiplier * 9.1,
    //         //   // bottom:0,
    //         //   child: Padding(
    //         //     padding: const EdgeInsets.only(top:3.6),
    //         //     child: Container(
    //         //       decoration: new BoxDecoration(
    //         //          borderRadius: BorderRadius.all(
    //         //       Radius.circular(SizeConfig.heightMultiplier * 2)),
    //         //           image: new DecorationImage(
    //         //         fit: BoxFit.cover,
    //         //         alignment: FractionalOffset.topCenter,
    //         //         image: new NetworkImage(
    //         //             //"https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/kfc.png"
    //         //             imageurl
    //         //             ),
    //         //       )),
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
