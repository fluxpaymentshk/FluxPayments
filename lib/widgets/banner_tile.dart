import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/banner.dart' as ban;

class BannerTile extends StatelessWidget {
  BannerTile({required this.banner, Key? key}) : super(key: key);
  // final i, imageurl, desc;
  //final String dueDate, imageurl, desc;
  final ban.Banner banner;
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
      height: SizeConfig.heightMultiplier * 26.5,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 2)),

        //   color: AppTheme.brownishPink,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 8.0,
            right: 15.0,
            left: 5.0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*3),
              padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 40),
              // height: SizeConfig.heightMultiplier * 22,
              // width: SizeConfig.widthMultiplier * 90,
              decoration: BoxDecoration(
                  color: AppTheme.brownishPink,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.heightMultiplier * 2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ],
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [
                      AppTheme.main,
                      AppTheme.offWhite,
                    ],
                  )),
              child: Container(
                //              decoration: BoxDecoration(

                //    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier*2)),

                //  color: AppTheme.brownishPink,

                // ),
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier*3, top: SizeConfig.heightMultiplier*1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Text(
                      //'08 sep, 2021',
                      banner.dueDate ?? '',
                      style: AppTheme.display3,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    // Text(
                    //   '\$ 1,354',
                    //   //amount,
                    //   style: AppTheme.display2bold,
                    // ),
                    // SizedBox(
                    //   height: SizeConfig.heightMultiplier * 1,
                    // ),
                    Text(
                      //'You are eligible for',
                      banner.heading ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.heightMultiplier * 2.3,
                        letterSpacing: SizeConfig.widthMultiplier / 10,
                        height: SizeConfig.heightMultiplier / 6.5,
                        color: Color(0xffffffff),
                      ),
                    ),
                    // SizedBox(
                    //   height: SizeConfig.heightMultiplier * 1,
                    // ),
                    // Text(
                    //   'HSBC Premiere Card',
                    //   style: AppTheme.display2,
                    // ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Container(
                      height: SizeConfig.heightMultiplier * 5,
                      width: SizeConfig.widthMultiplier * 29.5,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.heightMultiplier * 1.1)),
                        color: AppTheme.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          // _databaseLambdaService
                          //     .getCuratedList(page: null);
                        },
                        child: Center(
                            child: Text(
                          //'Claim Now',
                          banner.buttonDesc ?? '',

                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.heightMultiplier * 2.0,
                            letterSpacing: SizeConfig.widthMultiplier / 16,
                            height: SizeConfig.heightMultiplier / 10,
                            color: AppTheme.main,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Spacer(),

          Positioned.fill(
            bottom: 10.0,
            left: 210.0,
            child: Image.asset("assets/images/wallet.png"),
            //network.image(imageurl),
          ),
        ],
      ),
    );
  }
}
