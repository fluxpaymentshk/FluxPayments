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
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_bloc.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_event.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_state.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_bloc.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_event.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_state.dart';
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
import 'package:flux_payments/widgets/pending_payment_tile.dart';
import 'package:flux_payments/widgets/recent_payment_tile.dart';
import 'package:flux_payments/widgets/reward_partner_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  final String email;
  final UserConfigRepository? userRepository;
  final DatabaseRepository? databaseRepository;
  const HomePage(
      {Key? key,
      @required this.userRepository,
      @required this.databaseRepository,
      this.email = ""})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //UserConfigRepository _userConfigRepository = new UserConfigRepository();

  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  void initState() {
    //  SizeConfig().init(constraints);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    List<curatedList> curatedListData = [];
    List<ExternalAdvertisers> ExadvertiseList = [];
    List<InternalAdvertisers> InadvertiseList = [];

    var userBloc = BlocProvider.of<UserBloc>(context);
    var curatedListBloc = BlocProvider.of<CuratedListBloc>(context);
    var advertiserBloc = BlocProvider.of<AdvertiserBloc>(context);
    var bannerBloc = BlocProvider.of<BannerBloc>(context);
    var graphBloc = BlocProvider.of<GraphBloc>(context);

    var pendingServiceBloc = BlocProvider.of<PendingServiceBloc>(context);
    var recentPaymentBloc = BlocProvider.of<RecentPaymentBloc>(context);

    final DatabaseRepository databaseRepo = DatabaseRepository();
    bannerBloc.add(GetBannerEvent());
    userBloc.add(GetUserDetails(userID: 'flux-vid1'));
    graphBloc.add(GetGraphEvent(UserID: 'Flux-Monik'));
    recentPaymentBloc.add(GetRecentPaymentDetails(userID: 'Flux-Monik'));
    pendingServiceBloc
        .add(GetPendingService(userID: 'Flux-Monik', todayDate: '2021-07-23'));
    //((userID: 'flux-vid1'));

    advertiserBloc.add(GetExternalAdvertiserEvent(
        page: 0, externalAdvertiserList: ExadvertiseList));

    curatedListBloc
        .add(LoadCuratedListEvent(page: 0, curatedListData: curatedListData));

    log("EMAIL-------------------> ${widget.email}");

    //     await _databaseLambdaService.getCuratedList(page: 0) ;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        // _databaseLambdaService.getRecentPayment(userID: 'Flux-Monik');
        _databaseLambdaService.getPendingServices(
            userID: 'Flux-Monik', todayDate: '2021-07-23');
        if (state is UserDetailsLoading) {
          return CircularProgressIndicator(
            strokeWidth: 5,
            color: AppTheme.main,
          );
        } else if (state is UserDetails) {
          print('hjjjjjjjjj');
       

          return Scaffold(
          
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

              body: 
              //LayoutBuilder(builder: (context, constraints) {
          //  SizeConfig().init(constraints);
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

             Flex(direction: Axis.vertical, children: [
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

                      BlocBuilder<PendingServiceBloc, PendingServiceState>(
                        builder: (context, state) {
                          if (state is LoadPendingService) {
                            return PendingPaymentTile(
                                amount: state.pendingService["dueAmount"].toDouble(),
                                serviceProviders: state
                                    .pendingService["dueProviders"]
                                    .toInt());
                          } else if (State is LoadingPendingService) {
                            return CircularProgressIndicator();
                          } else if (state is PendingServiceError) {
                            return Container(
                              child: Text(state.message),
                            );
                          } else {
                            return Container(
                              child: Text('Unable to trigger Event!'),
                            );
                          }
                        },
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

                      BlocBuilder<CuratedListBloc, CuratedListState>(
                        builder: (context, state) {
                          if (state is LoadingCuratedList)
                            return CircularProgressIndicator(
                              strokeWidth: 5.0,
                              color: AppTheme.main,
                            );
                          else if (state is LoadedCuratedList) {
                            //currently done for only one page!!
                            return Container(
                              height: SizeConfig.heightMultiplier * 22,

                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: curatedListData.length,
                                  itemBuilder: (context, int index) {
                                    return rewardPartnerTile(
                                        background:
                                            curatedListData[index].background,
                                        imageurl: curatedListData[index].icon,
                                        desc: curatedListData[index].tagline,
                                        i: index);
                                  }),

                              //   ),
                            );
                          } else {
                            return Container(
                                child: Text(
                                    (state as ErrorCuratedist).message ?? ''));
                          }
                        },
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
                                //   mp:{'2021-09': {'ICICI': 20.0, 'HDFC': 10.0, 'PNB': 10.0, 'SBI': 10.0}, '2021-08': {'HDFC': 50.0,'ICICI': 100}},
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

                      //////////////////////////////###########################
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Text(
                      //         "My Recent Payment",
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       )),
                      // ),

                      // BlocBuilder<RecentPaymentBloc, RecentPaymentState>(
                      //   builder: (context, state) {
                      //     if (state is LoadingRecentPaymentState)
                      //       return CircularProgressIndicator();
                      //     else if (state is LoadRecentPaymentState) {
                      //       return Container(
                      //         height: SizeConfig.heightMultiplier * 9,

                      //         child: ListView.builder(
                      //             // scrollDirection: Axis.vertical,
                      //             physics: const ClampingScrollPhysics(),
                      //             itemCount: state.RecentPaymentData.length,
                      //             itemBuilder: (context, int index) {
                      //               return recentPaymentTile(
                      //                   name: state.RecentPaymentData[index]
                      //                       ['name'],
                      //                   paidOn: state.RecentPaymentData[index]
                      //                       ['paidOn'],
                      //                   imageurl: state.RecentPaymentData[index]
                      //                       ['imageurl'],
                      //                   amount: state.RecentPaymentData[index]
                      //                       ['amount']);
                      //             }),

                      //         //   ),
                      //       );
                      //     } else if (state is ErrorRecentPaymentState)
                      //       return Container(child: Text(state.message));
                      //     else
                      //       return Container(
                      //           child: Text(
                      //               'get recent payment details Event not Fired!'));
                      //   },
                      // ),
                    
                      //#############################################
                    ],
                  ),
                ),
              ),
            ])
            //   } else {
            //     return Center(
            //         child: CircularProgressIndicator(
            //       strokeWidth: 4.0,
            //     ));
            //   }
            // });
          // })

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
