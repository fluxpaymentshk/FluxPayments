import 'dart:developer' as dev;
import 'dart:math';

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
import 'package:flux_payments/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_event.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_state.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_bloc.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_event.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_state.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_bloc.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_event.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_state.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_bloc.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_event.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_state.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';
import 'package:flux_payments/models/Reward.dart';
import 'package:flux_payments/models/RewardPartner.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/payment_Screens/payment_screen.dart';
import 'package:flux_payments/screens/service_provider_cat.dart';
// import 'package:flux_payments/screens/change_password.dart';
// import 'package:flux_payments/screens/login_page.dart';
// import 'package:flux_payments/screens/password_reset.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/advertiser_tile.dart';
import 'package:flux_payments/widgets/banner_tile.dart';
import 'package:flux_payments/widgets/expand_widget.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';
import 'package:flux_payments/widgets/pending_payment_tile.dart';
import 'package:flux_payments/widgets/recent_payment_tile.dart';
import 'package:flux_payments/widgets/subheading.dart';

class BillPayment extends StatefulWidget {
  static const routeName = '/home';
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
  List<Reward> fav = [];
  bool loadAllFav = false;
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  void initState() {
    //  SizeConfig().init(constraints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user;
    var favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    favoritesBloc
        .add(GetFavorites(page: 1000, userID: 'fluxsam1', favorites: fav));
    List<curatedList> curatedListData = [];
    List<ExternalAdvertisers> ExadvertiseList = [];
    List<InternalAdvertisers> InadvertiseList = [];

    var userBloc = BlocProvider.of<UserBloc>(context);
    //  var curatedListBloc = BlocProvider.of<CuratedListBloc>(context);
    var advertiserBloc = BlocProvider.of<AdvertiserBloc>(context);
    var bannerBloc = BlocProvider.of<BannerBloc>(context);
    var graphBloc = BlocProvider.of<GraphBloc>(context);

    var pendingServiceBloc = BlocProvider.of<PendingServiceBloc>(context);
    var recentPaymentBloc = BlocProvider.of<RecentPaymentBloc>(context);
    var serviceProviderBloc = BlocProvider.of<ServiceProviderBloc>(context);
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

    // curatedListBloc
    //     .add(LoadCuratedListEvent(page: 0, curatedListData: curatedListData));

    //log("EMAIL-------------------> ${widget.email}");

    //     await _databaseLambdaService.getCuratedList(page: 0) ;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        // _databaseLambdaService.getRecentPayment(userID: 'Flux-Monik');
        _databaseLambdaService.getPendingServices(
            userID: 'Flux-Monik', todayDate: '2021-07-23');
        if (state is UserDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: AppTheme.main,
            ),
          );
        } else if (state is UserDetails) {
          print('hjjjjjjjjj');

          user = state.user;
          return Scaffold(
              body: Flex(direction: Axis.vertical, children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.4,
                    ),
                    Container(
                      height: SizeConfig.heightMultiplier * 12,
                      width: SizeConfig.widthMultiplier * 100,
                      child: Center(
                        //  child: Image.asset("assets/images/logo.png"),
                        child: fluxLogo(context),
                      ),
                    ),

                    Container(
                      height: SizeConfig.heightMultiplier * 12,
                      width: SizeConfig.widthMultiplier * 97,
                      //  decoration: BoxDecoration(color: AppTheme.main),
                      child: Row(
                        children: [
                          Padding(
                          padding:EdgeInsets.all(SizeConfig.heightMultiplier*2),
                          child: Center(
                            child: Container(
                              width: SizeConfig.widthMultiplier * 60,
                              height: SizeConfig.heightMultiplier * 10,
                              child: FittedBox(
                                child: Text(
                                 'Hello ${state.user.firstName}!',
                                  style: AppTheme.display1,
                                ),
                              ),
                            ),
                          ),
                        ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(
                                SizeConfig.widthMultiplier * 2.0),
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
                          return InkWell(
                            onTap:(){
                               Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => PaymentScreen(
                                    databaseRepository:
                                        widget.databaseRepository,
                                    userConfigRepository: widget.userRepository,
                                  ),
                                ),
                              );
                            },
                            child: PendingPaymentTile(
                                amount:
                                    state.pendingService["dueAmount"].toDouble(),
                                serviceProviders:
                                    state.pendingService["dueProviders"].toInt()),
                          );
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

//#### providers to be added!
                    //fav = state.favorites;

                    // if (fav.length < 10) {
                    //   fav = fav.sublist(0, fav.length);
                    // } else {
                    //   fav = fav.sublist(0, 10);
                    // }
                    // return
                    //fav.length == 0 ? Text("Please mark some favorites !") :

                    SizedBox(height: SizeConfig.heightMultiplier * 2),
                   subheading('MY Providers'),

                    BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                        if (state is LoadingFavorites) {
                          print("State is LoadindFavorites");
                          return CircularProgressIndicator(
                            strokeWidth: 5.0,
                            color: Colors.black,
                            //color: AppTheme.main,
                          );
                        } else if (state is LoadedFavorites) {
                          print("State is LoadedFavorites");
                          fav = state.favorites;
                          print("sttttttttttttttttttttttttttttttttttttttttttt");
                          print(fav.length);

                          ///################################
                          if (fav.length < 10) {
                            fav = fav.sublist(0, fav.length);
                          } else {
                            fav = fav.sublist(0, 10);
                          }
                          return
                              //fav.length == 0 ? Text("Please mark some favorites !") :
                              InkWell(
                                child: StatefulBuilder(
                                                          builder: (context, setState) => AnimatedContainer(
                                duration:Duration(milliseconds:300),
                                //height: fav.length > 5 && loadAllFav ?SizeConfig.heightMultiplier*100* 0.318 :SizeConfig.heightMultiplier*100* 0.21,
                                height: fav.length > 5 && loadAllFav
                                    ? SizeConfig.heightMultiplier * 100 * 0.45*((fav.length-5)~/5+1)
                                    : SizeConfig.heightMultiplier * 100 * 0.23,
                                padding: EdgeInsets.fromLTRB(
                                    SizeConfig.widthMultiplier * 100 * 0.01,
                                    SizeConfig.heightMultiplier * 100 * 0.016,
                                    SizeConfig.widthMultiplier * 100 * 0.01,
                                    SizeConfig.heightMultiplier * 100 * 0.01),
                                decoration: BoxDecoration(
                                  color: AppTheme.offWhite,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.widthMultiplier * 100 * 0.03),
                                ),
                                child: Column(
                                  children: [
                                    favContainer(0, min(fav.length, 5)),
                                    ExpandWidget(
                                      expand: loadAllFav,
                                      child: Container(
                                          height:  SizeConfig.heightMultiplier * 100 * 0.2*((fav.length-5)~/5+1),
                                          child: ListView.builder(
                                                //  itemCount:(fav.length-5)~/5,
                                                itemCount:(fav.length-5)~/5+1,
                                                //   itemExtent: 40,
                                                itemBuilder: (context, index) {
                                                  dev.log("${(fav.length)~/5}");
                                                  print(
                                                      "${(index + 1) * 5}  __##__ ${min(fav.length, 5)}");
                                      
                                                  return favContainer(
                                                      (index + 1) * 5,
                                                      min(fav.length,
                                                          (index + 2) * 5));
                                                }),
                                      ),
                                      //##################################################
                                      //   (fav.length >= 5 && loadAllFav)
                                      //       ? favContainer(5, min(fav.length, 10))
                                      //       : null,
                                    ),
                                    // SizedBox(
                                    //   height: SizeConfig.heightMultiplier *
                                    //       100 *
                                    //       0.01,
                                    // ),
                                    // if (fav.length >= 5 && loadAllFav)
                                    //   favContainer(5, min(fav.length, 10)),
                                    IconButton(
                                        onPressed: () {
                                          print(fav.length);
                                          print(
                                              "Icon button is presseddddddddddddddddddddddddddd");
                                          setState(() {
                                            loadAllFav = !loadAllFav;
                                          });
                                        },
                                        icon: loadAllFav
                                            ? Icon(Icons.file_upload)
                                            : Icon(Icons.file_download)),
                                    //     favContainer(0, min(fav.length, 5)),
                                    //     SizedBox(
                                    //       height:SizeConfig.heightMultiplier*100* 0.01,
                                    //     ),
                                    //     if (fav.length >= 5 && loadAllFav)
                                    //       favContainer(5, min(fav.length, 10)),
                                    //          IconButton(
                                    // onPressed: () {
                                    //   setState(() {
                                    //     loadAllFav = !loadAllFav;
                                    //   });
                                    // },
                                    // icon: Icon(loadAllFav
                                    //     ? Icons.upload
                                    //     : Icons.download)),
                                    // IconButton(onPressed: (){
                                    //   setState(() {
                                    //     loadAllFav =! loadAllFav;
                                    //   });
                                    // }, icon: Icon(Icons.file_upload))
                                  ],
                                ),
                                                          ),
                                                        ),
                             onDoubleTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return BlocProvider.value(
                                  value: serviceProviderBloc,
                                  child: ServiceProviderCategory(
                                    paymentData: {},
                                    user: user,
                                    databaseRepository:
                                        widget.databaseRepository,
                                  ),
                                );
                                // return GraphScreen(graphData: widget.mp, user: widget.user);
                              }));
                            },
                              );
                        } else {
                          return Container(
                            child: Text("No Favorites found !"
                               ),
                          );
                        }
                      },
                    ),

                    SizedBox(height: SizeConfig.heightMultiplier * 2),
                    // Container(
                    //   //height: fav.length > 5 && loadAllFav ?SizeConfig.heightMultiplier*100* 0.318 :SizeConfig.heightMultiplier*100* 0.21,
                    //   height: fav.length > 5 && loadAllFav
                    //       ? SizeConfig.heightMultiplier * 100 * 0.259
                    //       : SizeConfig.heightMultiplier * 100 * 0.148,
                    //   padding: EdgeInsets.fromLTRB(
                    //       SizeConfig.widthMultiplier * 100 * 0.01,
                    //       SizeConfig.heightMultiplier * 100 * 0.016,
                    //       SizeConfig.widthMultiplier * 100 * 0.01,
                    //       SizeConfig.heightMultiplier * 100 * 0.01),
                    //   decoration: BoxDecoration(
                    //     color: AppTheme.offWhite,
                    //     borderRadius: BorderRadius.circular(
                    //         SizeConfig.widthMultiplier * 100 * 0.03),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       favContainer(0, min(fav.length, 5)),
                    //       ExpandWidget(expand:loadAllFav,
                    //       child: (fav.length >= 5 && loadAllFav)? favContainer(5, min(fav.length, 10)):null,
                    //       ),
                    //       SizedBox(
                    //         height: SizeConfig.heightMultiplier * 100 * 0.01,
                    //       ),
                    //       // if (fav.length >= 5 && loadAllFav)
                    //       //   favContainer(5, min(fav.length, 10)),
                    //       IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               loadAllFav = !loadAllFav;
                    //             });
                    //           },
                    //           icon:   loadAllFav?Icon(Icons.file_upload):Icon(Icons.file_download)
                    //           )
                    //     ],
                    //   ),
                    // ),

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
                                  (state as ErrorInternalAdvertiser).message ??
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

                   subheading('Paid With Flux'),

                    BlocBuilder<GraphBloc, GraphState>(
                      builder: (context, state) {
                        if (state is LoadGraphState) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: LineChartGraph(
                              mp: state.graphData,
                              height: SizeConfig.heightMultiplier * 40,
                              width: SizeConfig.widthMultiplier * 90,
                              popup: true,
                              user: user,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "My Recent Payment",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),

                    BlocBuilder<RecentPaymentBloc, RecentPaymentState>(
                      builder: (context, state) {
                        if (state is LoadingRecentPaymentState)
                          return CircularProgressIndicator();
                        else if (state is LoadRecentPaymentState) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 3,
                                vertical: SizeConfig.heightMultiplier * 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.heightMultiplier * 2)),
                                border: Border.all(
                                    color: AppTheme.main, width: 1.0),
                              ),
                              height: SizeConfig.heightMultiplier * 47,
                              child:
                                  // ListView.builder(
                                  // scrollDirection: Axis.vertical,
                                  //physics: const ClampingScrollPhysics(),
                                  //itemCount: state.RecentPaymentData.length,
                                  //itemBuilder: (context, int index) {
                                  //   return

                                  Column(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.7,
                                  ),
                                  if (state.RecentPaymentData.length > 0)
                                    recentPaymentTile(
                                        name: state.RecentPaymentData[0]
                                            ['name'],
                                        paidOn: state.RecentPaymentData[0]
                                            ['paidOn'],
                                        imageurl: state.RecentPaymentData[0]
                                            ['imageurl'],
                                        amount: state.RecentPaymentData[0]
                                            ['amount']),
                                  if (state.RecentPaymentData.length > 1)
                                    Divider(
                                      indent: SizeConfig.widthMultiplier * 3.5,
                                      endIndent:
                                          SizeConfig.widthMultiplier * 3.5,
                                      color: Color(0xff979797),
                                      thickness: 0.8,
                                    ),
                                  if (state.RecentPaymentData.length > 1)
                                    recentPaymentTile(
                                        name: state.RecentPaymentData[1]
                                            ['name'],
                                        paidOn: state.RecentPaymentData[1]
                                            ['paidOn'],
                                        imageurl: state.RecentPaymentData[1]
                                            ['imageurl'],
                                        amount: state.RecentPaymentData[1]
                                            ['amount']),
                                  if (state.RecentPaymentData.length > 2)
                                    Divider(
                                      indent: SizeConfig.widthMultiplier * 3.5,
                                      endIndent:
                                          SizeConfig.widthMultiplier * 3.5,
                                      color: Color(0xff979797),
                                      thickness: 0.8,
                                    ),
                                  if (state.RecentPaymentData.length > 2)
                                    recentPaymentTile(
                                        name: state.RecentPaymentData[2]
                                            ['name'],
                                        paidOn: state.RecentPaymentData[2]
                                            ['paidOn'],
                                        imageurl: state.RecentPaymentData[2]
                                            ['imageurl'],
                                        amount: state.RecentPaymentData[2]
                                            ['amount']),
                                  if (state.RecentPaymentData.length > 3)
                                    Divider(
                                      indent: SizeConfig.widthMultiplier * 3.5,
                                      endIndent:
                                          SizeConfig.widthMultiplier * 3.5,
                                      color: Color(0xff979797),
                                      thickness: 0.8,
                                    ),
                                  if (state.RecentPaymentData.length > 3)
                                    recentPaymentTile(
                                        name: state.RecentPaymentData[3]
                                            ['name'],
                                        paidOn: state.RecentPaymentData[3]
                                            ['paidOn'],
                                        imageurl: state.RecentPaymentData[3]
                                            ['imageurl'],
                                        amount: state.RecentPaymentData[3]
                                            ['amount']),
                                  if (state.RecentPaymentData.length > 4)
                                    Divider(
                                      indent: SizeConfig.widthMultiplier * 3.5,
                                      endIndent:
                                          SizeConfig.widthMultiplier * 3.5,
                                      color: Color(0xff979797),
                                      thickness: 0.8,
                                    ),
                                  if (state.RecentPaymentData.length > 4)
                                    recentPaymentTile(
                                        name: state.RecentPaymentData[4]
                                            ['name'],
                                        paidOn: state.RecentPaymentData[4]
                                            ['paidOn'],
                                        imageurl: state.RecentPaymentData[4]
                                            ['imageurl'],
                                        amount: state.RecentPaymentData[4]
                                            ['amount']),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.7,
                                  ),
                                ],
                              ),
                            ),
                           
                          );
                        } else if (state is ErrorRecentPaymentState)
                          return Container(child: Text(state.message));
                        else
                          return Container(
                              child: Text(
                                  'get recent payment details Event not Fired!'));
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 7,
                    )
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

  Widget favContainer(start, end) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: fav.sublist(start, end).map((e) {
          print(fav.length);
          return Container(
            width: SizeConfig.widthMultiplier * 100 * 0.18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: SizeConfig.widthMultiplier * 100 * 0.005,
                        blurRadius: SizeConfig.widthMultiplier * 100 * 0.005,
                        offset: Offset(SizeConfig.widthMultiplier * 100 * 0.007,
                            SizeConfig.heightMultiplier * 100 * 0.005),
                      ),
                    ],
                  ),
                  height: SizeConfig.heightMultiplier * 100 * 0.075,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://img.etimg.com/thumb/msid-59738997,width-640,resizemode-4,imgsize-21421/nike.jpg",
                    ),
                    backgroundColor: AppTheme.main,
                    radius: SizeConfig.heightMultiplier * 100 * 0.11,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 100 * 0.009,
                ),
                Center(
                  child: Text(
                    e.name.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 100 * 0.022,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList());
  }
}
