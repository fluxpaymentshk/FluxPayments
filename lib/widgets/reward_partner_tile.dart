import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class rewardPartnerTile extends StatelessWidget {
  rewardPartnerTile(
      {this.background, this.i, this.imageurl, this.desc, Key? key})
      : super(key: key);
  final String? imageurl, desc, background;
  final int? i;
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
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          height: SizeConfig.heightMultiplier * 13,
          width: SizeConfig.widthMultiplier * 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.heightMultiplier * 2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                ),
              ],
              //   color:Colors.black,
              gradient: LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                  colors: colors[i! % 4])),
          child: (imageurl != null)
              ? Stack(
                  children: [
                    //  SizedBox(height:SizeConfig.heightMultiplier * 2,),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.7, left: 4.2, right: 4.2),
                      child: Container(
                        child: Text(
                          //'Hot juicy chicken with KFC',
                          desc ?? '',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        top: SizeConfig.heightMultiplier * 9.1,

                        // bottom:0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.6),
                          child: Container(
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.heightMultiplier * 2)),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: FractionalOffset.topCenter,
                                  image: new NetworkImage(
                                    //"https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/kfc.png"
                                    imageurl!,
                                  )),
                            ),
                          ),
                        ))
                  ],
                )
              : (background != null)
                  ? Stack(
                      children: [
                        //  SizedBox(height:SizeConfig.heightMultiplier * 2,),
                        Positioned.fill(
                            top: 0,
                            // bottom:0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.6),
                              child: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.heightMultiplier * 2)),
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter,
                                      image: new NetworkImage(
                                        //"https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/kfc.png"
                                        background!,
                                      )),
                                ),
                              ),
                            )),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.7, left: 4.2, right: 4.2),
                          child: Container(
                            child: Text(
                              //'Hot juicy chicken with KFC',
                              desc ?? '',
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        //  SizedBox(height:SizeConfig.heightMultiplier * 2,),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.7, left: 4.2, right: 4.2),
                          child: Container(
                            child: Text(
                              //'Hot juicy chicken with KFC',
                              desc ?? '',
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
