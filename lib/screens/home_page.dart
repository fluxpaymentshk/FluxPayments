import 'dart:developer';

import 'package:amplify_flutter/amplify.dart';
import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/RewardPartner.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/change_password.dart';
import 'package:flux_payments/screens/login_page.dart';
import 'package:flux_payments/screens/password_reset.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/advertiser_tile.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';
import 'package:flux_payments/widgets/reward_partner_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  final String email;
  final UserConfigRepository? userRepository;
  const HomePage({Key? key, @required this.userRepository, this.email = ""})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserConfigRepository _userConfigRepository = new UserConfigRepository();

  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  void initState() {
    super.initState();
  }

  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Payments',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2:gift',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  List<RewardPartner> rewardPartner = [
    RewardPartner(
        name: 'kfc',
        shortDescription: 'hot juicy chicken with kfc',
        image:
            "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/kfc.png"),
    RewardPartner(
        name: 'cleb',
        shortDescription: 'celebrate every successwith flux',
        image:
            "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/celebrate.png"),
    RewardPartner(
        name: 'beach',
        shortDescription: 'cashless beachday with flux',
        image:
            "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/beach.png"),
    RewardPartner(
        name: 'central food',
        shortDescription: 'Michelin in Central',
        image:
            "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/centrall.png"),
  ];
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    log("EMAIL-------------------> ${widget.email}");

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('BottomNavigationBar Sample'),
        // ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () async {
        //         Map<String, dynamic> r = await _databaseLambdaService
        //             .getPaymentHistoryProviderWiseDetails(userID: "Flux-Monik");
        //         r.forEach((key, value) {
        //           if (key == "records") print(key + "--->" + value.toString());
        //         });
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           SnackBar(
        //             content: Text("Called the lambda function"),
        //             behavior: SnackBarBehavior.floating,
        //           ),
        //         );
        //       },
        //       child: Icon(Icons.run_circle_outlined, size: 40),
        //     ),
        //     SizedBox(height: 10),
        //     FloatingActionButton(
        //       onPressed: () async {
        //         await Amplify.Auth.signOut();
        //         Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        //       },
        //       child: Icon(Icons.logout),
        //     ),
        //   ],
        // ),

        body: LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return Flex(direction: Axis.horizontal, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 8,
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 12,
                  width: SizeConfig.widthMultiplier * 100,
                  child: Center(
                    //  child: Image.asset("assets/images/logo.png"),
                    child: Text(
                      "Flux.",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[AppTheme.main, Color(0xffA867EE)],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: SizeConfig.heightMultiplier * 12,
                  width: SizeConfig.widthMultiplier * 97,
                  //  decoration: BoxDecoration(color: AppTheme.main),
                  child: Row(
                    children: [
                      Text(
                        'Hello Vidit!',
                        style: AppTheme.display1,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          // height: SizeConfig.heightMultiplier*12,
                          // width: SizeConfig.widthMultiplier*100,

                          child: Image.asset("assets/images/av.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 25,
                  width: SizeConfig.widthMultiplier * 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.heightMultiplier * 2)),

//   color: AppTheme.brownishPink,
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 8.0,
                        right: 15.0,
                        left: 5.0,
                        child: Container(
                          height: SizeConfig.heightMultiplier * 22,
                          width: SizeConfig.widthMultiplier * 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.heightMultiplier * 2)),
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

                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 2,
                                      ),
                                      Text(
                                        '08 sep, 2021',
                                        style: AppTheme.display3,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 4,
                                      ),
                                      Text(
                                        '\$ 1,354',
                                        style: AppTheme.display2bold,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 1,
                                      ),
                                      Text(
                                        'You are eligible for',
                                        style: AppTheme.display2,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 1,
                                      ),
                                      Text(
                                        'HSBC Premiere Card',
                                        style: AppTheme.display2,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 2,
                                      ),
                                      Container(
                                        height: SizeConfig.heightMultiplier * 5,
                                        width:
                                            SizeConfig.widthMultiplier * 23.5,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3.0,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.heightMultiplier *
                                                      1.1)),
                                          color: AppTheme.white,
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Claim Now',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.heightMultiplier *
                                                    2.0,
                                            letterSpacing:
                                                SizeConfig.widthMultiplier / 16,
                                            height:
                                                SizeConfig.heightMultiplier /
                                                    10,
                                            color: AppTheme.main,
                                          ),
                                        )),
                                      ),
                                    ],
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
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: SizeConfig.heightMultiplier * 7.5,
                      width: SizeConfig.widthMultiplier * 93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.heightMultiplier * 1)),
                        border: Border.all(color: AppTheme.red),
                        color: Color(0xffFFECEC),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0),
                            child: Text(
                              'Pending \$120 payments from 4 providers',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "For You",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

//Horizontal list view builder.

                //  Container(

                //  ),

                //////////////////////

                Container(
                  height: SizeConfig.heightMultiplier * 22,

                  //    child: Expanded(

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),

                      // shrinkWrap: true,

                      itemCount: rewardPartner.length,
                      itemBuilder: (context, int index) {
                        return rewardPartnerTile(
                            imageurl: rewardPartner[index].image,
                            desc: rewardPartner[index].shortDescription,
                            i: index);
                      }),

                  //   ),
                ),

                //  rewardPartnerTile(),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Points",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

                Container(
                  height: SizeConfig.heightMultiplier * 32,
                  width: SizeConfig.widthMultiplier * 94,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.heightMultiplier * 2)),
                    color: AppTheme.offWhite,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: SizeConfig.heightMultiplier * 15,
                            width: SizeConfig.widthMultiplier * 65,
                            child: Row(
                              children: [
                                Container(
                                    child:
                                        Image.asset("assets/images/coin.png")),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.heightMultiplier * 1.5,
                                    ),
                                    Text(
                                      '5000',
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Flux Points',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 8.0, bottom: 8.0),
                        child: Text(
                          'Congratulations! You are among top 5 % of highest point users.!',
                          style: TextStyle(
                            color: AppTheme.main,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What's New",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

                advertiserTile(),

                //   Spacer(),

                //   Container(child: Flexible(fit: FlexFit.loose,child: LineChartSample1())),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Paid With Flux",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChartGraph(),
                ),
              ],
            ),
          ),
        ),
      ]);
    })

        //  Column(
        //   children: [
        //     SizedBox(
        //       height: 250,
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: Padding(
        //         padding: const EdgeInsets.all(5),
        //         child: Container(
        //           height: 35,
        //           width: 220,
        //           decoration: BoxDecoration(
        //               color: Colors.blue, borderRadius: BorderRadius.circular(1)),
        //           child: TextButton(
        //             onPressed: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (_) => BlocProvider.value(
        //                     value: userBloc,
        //                     // create: (_) => UserBloc(
        //                     //     widget.userRepository ?? _userConfigRepository),
        //                     child: ChangePassword(),
        //                   ),
        //                 ),
        //               );
        //             },
        //             child: Text(
        //               'Change Password',
        //               style: TextStyle(color: Colors.white, fontSize: 17),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(5),
        //       child: Container(
        //         height: 35,
        //         width: 220,
        //         decoration: BoxDecoration(
        //             color: Colors.blue, borderRadius: BorderRadius.circular(1)),
        //         child: TextButton(
        //           onPressed: () {
        //             userBloc.add(
        //                 UserResetPasswordEvent(email: widget.email, code: ""));
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (_) => BlocProvider(
        //                   create: (_) => UserBloc(
        //                       widget.userRepository ?? _userConfigRepository),
        //                   child: PasswordReset(
        //                     userConfigRepository: widget.userRepository,
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           child: Text(
        //             'Reset Password',
        //             style: TextStyle(color: Colors.white, fontSize: 17),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        );
  }
}
