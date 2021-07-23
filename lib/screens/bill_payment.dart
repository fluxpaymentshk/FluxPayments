import 'dart:developer';

import 'package:amplify_flutter/amplify.dart';
import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/advertiser_bloc/advertiser_bloc.dart';
import 'package:flux_payments/bloc/advertiser_bloc/advertiser_event.dart';
import 'package:flux_payments/bloc/advertiser_bloc/advertiser_state.dart';
import 'package:flux_payments/bloc/banner_bloc/banner_State.dart';
import 'package:flux_payments/bloc/banner_bloc/banner_bloc.dart';
import 'package:flux_payments/bloc/banner_bloc/banner_event.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_bloc.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_event.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_state.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_bloc.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_event.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';
import 'package:flux_payments/models/RewardPartner.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/change_password.dart';
import 'package:flux_payments/screens/login_page.dart';
import 'package:flux_payments/screens/password_reset.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/advertiser_tile.dart';
import 'package:flux_payments/widgets/banner_tile.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';
import 'package:flux_payments/widgets/reward_partner_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class BillPayment extends StatefulWidget {
  static const routeName = '/billPayment';
  final String email;
  final UserConfigRepository? userRepository;
  final DatabaseRepository? databaseRepository;
  const BillPayment(
      {Key? key,
      @required this.userRepository,
      @required this.databaseRepository,
      this.email = ""})
      : super(key: key);

  @override
  _BillPaymentState createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  //UserConfigRepository _userConfigRepository = new UserConfigRepository();

  // DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

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

  // List<RewardPartner> rewardPartner =
  // [
  //   RewardPartner(
  //       name: 'kfc',
  //       shortDescription: 'hot juicy chicken with kfc',
  //       image:
  //           "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/kfc.png"),
  //   RewardPartner(
  //       name: 'cleb',
  //       shortDescription: 'celebrate every successwith flux',
  //       image:
  //           "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/celebrate.png"),
  //   RewardPartner(
  //       name: 'beach',
  //       shortDescription: 'cashless beachday with flux',
  //       image:
  //           "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/beach.png"),
  //   RewardPartner(
  //       name: 'central food',
  //       shortDescription: 'Michelin in Central',
  //       image:
  //           "https://amplify-fluxpayments-staging-122415-deployment.s3.ap-southeast-1.amazonaws.com/rewardPartner/centrall.png"),
  // ];

  @override
  Widget build(BuildContext context) {
 //   List<curatedList> curatedListData = [];
    List<ExternalAdvertisers> ExadvertiseList = [];
    List<InternalAdvertisers> InadvertiseList = [];

    var userBloc = BlocProvider.of<UserBloc>(context);
  //  var curatedListBloc = BlocProvider.of<CuratedListBloc>(context);
    var advertiserBloc = BlocProvider.of<AdvertiserBloc>(context);
    var bannerBloc = BlocProvider.of<BannerBloc>(context);
    var graphBloc = BlocProvider.of<GraphBloc>(context);

    final DatabaseRepository databaseRepo = DatabaseRepository();
    bannerBloc.add(GetBannerEvent());
    userBloc.add(GetUserDetails(userID: 'flux-vid1'));
    graphBloc.add(GetGraphEvent(UserID: 'Flux-Monik'));
    //((userID: 'flux-vid1'));

    advertiserBloc.add(GetExternalAdvertiserEvent(
        page: 0, externalAdvertiserList: ExadvertiseList));

    // curatedListBloc
    //     .add(LoadCuratedListEvent(page: 0, curatedListData: curatedListData));

    //  var
    log("EMAIL-------------------> ${widget.email}");

    //     await _databaseLambdaService.getCuratedList(page: 0) ;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserDetailsLoading) {
          return CircularProgressIndicator(
            strokeWidth: 5,
            color: AppTheme.main,
          );
        } else if (state is UserDetails) {
          print('hjjjjjjjjj');
          // databaseRepo.getPaymentHistoryProviderWiseDetails(
          //     userID: "Flux-Monik");

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
            // return FutureBuilder(
            //     future:
            //         //  _databaseLambdaService.getCuratedList(
            //         //      page: 0, curatedListData: curatedListData)
            //         // //_databaseLambdaService.getUserDetails(userID: 'flux-vid1')
            //         // _databaseLambdaService.getPaymentHistoryProviderWiseDetails(
            //         //     userID: 'flux-vid1')
            //         // ,
            //     builder: (context, snapshot) {

            //       if (snapshot.connectionState != snapshot.hasError) {

            return Flex(direction: Axis.vertical, children: [
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
                                  colors: <Color>[
                                    AppTheme.main,
                                    Color(0xffA867EE)
                                  ],
                                ).createShader(
                                    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
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
                              'Hello ${state.user.firstName}!',
                              style: AppTheme.display1,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                // height: SizeConfig.heightMultiplier*12,
                                // width: SizeConfig.widthMultiplier*100,

                                child: Image.asset("assets/images/av.png"),
                                //  child:NetworkImage(state.user.);
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      BlocBuilder<BannerBloc, BannerState>(
                          builder: (context, state) {
                        if (state is LoadBannerState) {
                          return BannerTile(banner: state.banner);
                        } else if (state is LoadingBannerState)
                          return CircularProgressIndicator(
                            color: AppTheme.main,
                            strokeWidth: 1.0,
                          );
                        else if (state is BannerErrorState) {
                          return Container(
                            child: Text((state).message ?? ''),
                          );
                        } else {
                          return Container(child: Text('event Not generated'));
                        }
                      }),

                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: SizeConfig.heightMultiplier * 7.5,
                            width: SizeConfig.widthMultiplier * 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.heightMultiplier * 1)),
                              border: Border.all(color: AppTheme.red),
                              color: Color(0xffFFECEC),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 9.0),
                                  child: Text(
                                    'Pending \$ 120 payments from 4 providers',
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

                      // BlocBuilder<CuratedListBloc, CuratedListState>(
                      //   builder: (context, state) {
                      //     if (state is LoadingCuratedList)
                      //       return CircularProgressIndicator(
                      //         strokeWidth: 5.0,
                      //         color: AppTheme.main,
                      //       );
                      //     else if (state is LoadedCuratedList) {
                      //       //currently done for only one page!!
                      //       return Container(
                      //         height: SizeConfig.heightMultiplier * 22,

                      //         child: ListView.builder(
                      //             scrollDirection: Axis.horizontal,
                      //             physics: AlwaysScrollableScrollPhysics(),
                      //             itemCount: curatedListData.length,
                      //             itemBuilder: (context, int index) {
                      //               return rewardPartnerTile(
                      //                   background:
                      //                       curatedListData[index].background,
                      //                   imageurl: curatedListData[index].icon,
                      //                   desc: curatedListData[index].tagline,
                      //                   i: index);
                      //             }),

                      //         //   ),
                      //       );
                      //     } else {
                      //       return Container(
                      //           child: Text(
                      //               (state as ErrorCuratedist).message ?? ''));
                      //     }
                      //   },
                      // ),

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
                                          child: Image.asset(
                                              "assets/images/coin.png")),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 2,
                                      ),
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    1.5,
                                          ),
                                          Text(
                                            state.user.fluxPoints.toString(),
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
                              child: Center(
                                child: Text(
                                  'Congratulations! You are among top 5 % of highest point users.!',
                                  style: TextStyle(
                                    color: AppTheme.main,
                                    fontSize: 12,
                                  ),
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

                      BlocBuilder<AdvertiserBloc, AdvertiserState>(
                        builder: (context, state) {
                          if (state is ErrorExternalAdvertiser ||
                              state is ErrorInternalAdvertiser)
                            return Center(
                              child: Container(
                                child: Text((state as ErrorExternalAdvertiser)
                                        .message ??
                                    (state as ErrorInternalAdvertiser)
                                        .message ??
                                    ''),
                              ),
                            );
                          if (state is LoadingExternalAdvertiser ||
                              state is LoadingInternalAdvertiser) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.main,
                                strokeWidth: 5.0,
                              ),
                            );
                          } else if (state is LoadedExternalAdvertiser) {
                            // advertiserBloc.add(GetInternalAdvertiserEvent(
                            //     page: 0,
                            //     internalAdvertiserList: InadvertiseList));
                            //  if (state is LoadingExternalAdvertiser)
                            return Container(
                              margin: EdgeInsets.all(6.0),
                              height: SizeConfig.heightMultiplier * 18,

                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: ExadvertiseList.length,
                                  itemBuilder: (context, int index) {
                                    return advertiserTile(
                                        i: index,
                                        imageurl:
                                            ExadvertiseList[index].productPic ??
                                                '',
                                        desc: ExadvertiseList[index]
                                                .shortDescription ??
                                            '');
                                  }),

                              //   ),
                            );
                          } else {
                            // To Configure it
                            //  advertiserBloc.add(GetInternalAdvertiserEvent(
                            //     page: 0,
                            //     internalAdvertiserList: InadvertiseList));
                            //  if (state is LoadingExternalAdvertiser)
                            return CircularProgressIndicator();
                          }
                        },
                      ),

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

                      BlocBuilder<GraphBloc, GraphState>(
                        builder: (context, state) {
                          if (state is LoadGraphState) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LineChartGraph(
                                mp: state.graphData,
                              ),
                            );
                          } else if (state is LoadingGraphState) {
                            return CircularProgressIndicator();
                          } else if (state is ErrorGraphState) {
                            return Container(
                              child: Text(state.message),
                            );
                          } else {
                            return Container(
                              child: Text('event not fired!'),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]);
            //   } else {
            //     return Center(
            //         child: CircularProgressIndicator(
            //       strokeWidth: 4.0,
            //     ));
            //   }
            // });
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
        } else if (state is UserDetailsError) {
          return Container(child: Text((state).message));
        } else {
          return Container();
        }
      },
    );
  }
}
