import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_bloc.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_event.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/Rewards.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/clip_circle.dart';
import 'package:flux_payments/widgets/draw_dashline.dart';
import 'package:flux_payments/widgets/expand_widget.dart';
import 'package:flux_payments/widgets/generate_map.dart';
import 'package:flux_payments/widgets/qr_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CouponDetailScreen extends StatefulWidget {
  final String? uid;
  final double? fluxPoints;
  final Rewards? rewardInfo;
  const CouponDetailScreen(
      {Key? key,
      @required this.uid,
      @required this.fluxPoints,
      @required this.rewardInfo})
      : super(key: key);

  @override
  _CouponDetailScreenState createState() => _CouponDetailScreenState();
}

class _CouponDetailScreenState extends State<CouponDetailScreen> {
  var uuid = Uuid(options: {'grng': UuidUtil.cryptoRNG});
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final Shader linearGradientText = LinearGradient(
    // center: Alignment(-1,-1),
    // radius:2,
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xffB772EE),
      Color(0xff7041EE),
    ],
  ).createShader(
    Rect.fromLTWH(1.0, 20.0, 20.0, 80.0),
  );
  bool isRedeemed = false;

  late Rewards rewards;
  @override
  void initState() {
    rewards = widget.rewardInfo!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fluxPointsBloc = BlocProvider.of<FluxPointsBloc>(context);
    Size size = MediaQuery.of(context).size;
    double bottomUp = size.height * 0.005, holeRadius = size.width * 0.17;
    return Scaffold(
      floatingActionButton:
          backButton(context, "couponDetailsButton", Color(0xffFAD7A1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: FutureBuilder<bool>(
          future: DatabaseLambdaService()
              .getCouponInfo(userID: widget.uid, rewardID: rewards.rewardID),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            log("${snapshot.data}");
            isRedeemed = snapshot.data!;
            return SmartRefresher(
              // RefreshController _refreshController =
              //     RefreshController(initialRefresh: false);
              enablePullDown: true,
              enablePullUp: true,

              // header: WaterDropHeader(),
              controller: _refreshController,
              onRefresh: () {
                // setState(() {
                  
                // });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: fluxPointsBloc,
                        child: super.widget,
                      ),
                    ));
                // setState(() {

                // });
              },
              onLoading: () {},
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    // automaticallyImplyLeading: false,
                    expandedHeight: MediaQuery.of(context).size.height * 0.4,
                    floating: false,
                    backgroundColor: Color(0xffFAD7A1),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            height: MediaQuery.of(context).size.height * 0.45,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //     "assets/images/burger.png",
                              //   ),
                              // ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xffFAD7A1), Color(0xffE96D71)],
                              ),
                            ),
                            // child: ,
                          ),
                          Positioned(
                            right: -40,
                            bottom: 0,
                            child: Image.network(
                              rewards.image ?? "",
                              scale: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ClipPath(
                          clipper: CircleClipper(bottomUp, holeRadius),
                          child: CustomPaint(
                            foregroundPainter:
                                DashLineDrawer(context, bottomUp, holeRadius),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                ),
                                color: Color(0xffE9E9FF),
                              ),
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                              height: MediaQuery.of(context).size.height * 0.27,
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.all(15),
                                    // padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          2,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Valid until ${rewards.expiryDate}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          color: AppTheme.main,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    widget.rewardInfo?.shortDescription ?? "",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.rewardInfo?.longDescription ??
                                        "!! Not enough information given by reward Partner",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Align(
                                  //     alignment: Alignment.bottomCenter,
                                  //     child: A
                                  //   ),
                                  // ),

                                  // if (isRedeemed)
                                  // Center(
                                  //   child: AnimatedContainer(
                                  //     duration: Duration(milliseconds: 6500),
                                  //     curve: Curves.linearToEaseOut,
                                  //     // width: 450,
                                  //     // height: isRedeemed ? 250 : 10,
                                  //     child: isRedeemed
                                  //         ? generateQRCode("testing")
                                  //         : null,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(5),
                            ),
                            color: Color(0xffE9E9FF),
                          ),
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                          duration: Duration(milliseconds: 500),
                          height: !isRedeemed
                              ? MediaQuery.of(context).size.height * 0.085
                              : MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 180,
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          minVerticalPadding: 1,
                                          horizontalTitleGap: 1,
                                          leading: Image.asset(
                                            "assets/images/coin.png",
                                            height: 40,
                                          ),
                                          title: Text(
                                            widget.rewardInfo?.amount
                                                    .toString() ??
                                                "",
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              // color: AppTheme.main,
                                              foreground: Paint()
                                                ..shader = linearGradientText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: holeRadius / 4,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            if (widget.fluxPoints! >=
                                                (widget.rewardInfo?.amount
                                                        ?.toInt() ??
                                                    0)) {
                                              String code = uuid.v4(options: {
                                                    'rng': UuidUtil.cryptoRNG
                                                  }) +
                                                  DateTime.now()
                                                      .millisecondsSinceEpoch
                                                      .toString();
                                              log("$code");
                                              fluxPointsBloc.add(
                                                UpdateFluxPoints(
                                                    userID: widget.uid,
                                                    appEvent:
                                                        FluxPointServiceType
                                                            .ServiceTransaction,
                                                    servicePoints: (widget
                                                                .rewardInfo
                                                                ?.amount ??
                                                            0) *
                                                        -1.0,
                                                    amount: widget.rewardInfo
                                                            ?.amount ??
                                                        0,
                                                    rewardID: rewards.rewardID,
                                                    rewardPartnerID:
                                                        rewards.rewardPartnerID,
                                                    shopID: rewards.shopID,
                                                    timestamp: DateTime.now()
                                                        .toString(),
                                                    rewardTransID: code),
                                              );
                                              setState(() {
                                                isRedeemed = true;
                                                log("11222 $isRedeemed");
                                              });
                                            } else {
                                              log("NOT enough poits");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "Not enough points",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor: Colors.red,
                                                // behavior: SnackBarBehavior.floating,
                                                duration: Duration(seconds: 5),
                                              ));
                                            }
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  8,
                                                ),
                                              ),
                                              border: Border.all(
                                                  color: AppTheme.main),
                                              gradient: isRedeemed
                                                  ? null
                                                  : RadialGradient(
                                                      center:
                                                          Alignment(0.6, 0.5),
                                                      colors: [
                                                        Color(0xffB772EE),
                                                        Color(0xff7041EE),
                                                      ],
                                                      radius: 2.5,
                                                    ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                isRedeemed
                                                    ? "Redeemed"
                                                    : "Redeem Now",
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  // height: 20,
                                                  color: isRedeemed
                                                      ? AppTheme.main
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isRedeemed)
                                  //   Center(
                                  //     child:
                                  Container(
                                    width: size.width * 0.9,
                                    height: size.width * 0.9,
                                    child: //Text("QR    COde")
                                        ExpandWidget(
                                      child: generateQRCode(context, "testing"),
                                      expand: isRedeemed,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (isRedeemed)
                          Center(
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.05),
                              width: size.width * 0.9,
                              height: size.height * 0.7,
                              child: ExpandWidget(
                                child: GenerateMapWidget(
                                  longitude: widget.rewardInfo?.longitude,
                                  latitude: widget.rewardInfo?.latitude,
                                  title: widget.rewardInfo?.name,
                                ),
                                expand: isRedeemed,
                              ),
                            ),
                          ),
                        if (!isRedeemed)
                          Divider(
                            color: AppTheme.main,
                            indent: 16,
                            endIndent: 16,
                          ),
                        // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        if (!isRedeemed)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Terms & Condition",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (!isRedeemed)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 1, 16, 16),
                            child: Text(
                              widget.rewardInfo?.termsncond ??
                                  "No extra description provided",
                              style: GoogleFonts.montserrat(fontSize: 10),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
