import 'dart:developer';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_bloc.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_event.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_state.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_bloc.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_event.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_state.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/RewardCategory.dart';
import 'package:flux_payments/models/Rewards.dart';
import 'package:flux_payments/screens/coupon_details.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:otp_text_field/style.dart';

class RewardsSearchScreen extends StatefulWidget {
  final List<RewardCategory>? categories;
  final List<Reward>? favorites;
  const RewardsSearchScreen(
      {Key? key, this.categories, @required this.favorites})
      : super(key: key);

  @override
  _RewardsSearchScreenState createState() => _RewardsSearchScreenState();
}

class _RewardsSearchScreenState extends State<RewardsSearchScreen> {
  var color1 = Color(0xFF7041EE);
  var color = Color(0xFFE9E9FF);
  var bordercolor = (Colors.grey[700])!;
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
  List<String> selectedCategories = [];
  List<Rewards> r = [];
  late List<RewardCategory>? categories;
  final TextEditingController _textEditingController = TextEditingController();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData _locationData =
      LocationData.fromMap({"longitde": 0.0, "latitude": 0.0});
  late var couponsSearchBloc;
  Location location = Location();
  List<String> favorites = []; //['REWPAR_1', 'Nike'];
  int j = 0;
  // late List<String> favs ;
  @override
  void initState() {
    categories = widget.categories;
    print("1.1");
    DatabaseLambdaService().getRewards();
    setLocation();
    print("2.1");
    // widget.favorites!.forEach((element) {
    //   favorites.add(element.rewardpartnerID!);
    // });
    // getFluxPoints();
    favorites = BlocProvider.of<FavoritesBloc>(context).getFavoritesList;
    couponsSearchBloc = BlocProvider.of<CouponsSearchBloc>(context);
    couponsSearchBloc.add(LoadCouponsSearch());
    super.initState();
  }

  Future<void> setLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    log("$_locationData");
  }

  // Future<double> getFluxPoints() async {
  //   Map<String, dynamic> res =
  //       await DatabaseLambdaService().getFluxPoints("Flux-Monik");
  //   double r = res["records"] == null ? 0 : res["records"][0][0]["longValue"];
  //   print("$r");
  //   return r;
  // }

  String _choosenVal = "Sort";
  @override
  Widget build(BuildContext context) {
    log("&**-!!---*&$favorites");
    var fluxPointsBloc = BlocProvider.of<FluxPointsBloc>(context);
    Size size = MediaQuery.of(context).size;
    // var couponsSearchBloc = BlocProvider.of<CouponsSearchBloc>(context);
    // couponsSearchBloc.add(LoadCouponsSearch());
    print("ji");
    fluxPointsBloc.add(GetFluxPoints(userID: "Flux-Monik"));
    return Scaffold(
      floatingActionButton: backButton(context, "button1"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: ListView(
        padding: EdgeInsets.only(top: 18),
        children: [
          Align(
            alignment: Alignment.center,
            child: fluxLogo(context),
          ),
          Container(
            height: size.height * 0.06,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.01, vertical: size.height * 0.002),
            margin: EdgeInsets.fromLTRB(
                size.width * 0.05, size.height * 0.01, size.width * 0.05, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: size.width * 0.005,
                  spreadRadius: size.width * 0.002,
                  offset: Offset(size.width * 0.007, size.height * 0.005),
                ),
              ],
              border: Border.all(
                color: color1,
              ),
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            child: TextFormField(
              autofocus: false,
              controller: _textEditingController,
              onFieldSubmitted: (s) {
                print('#$s');
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: color1,
                ),
                hintText: "Search for my favorite brand",
                prefixIcon: Icon(
                  Icons.search,
                  size: size.height * 0.05,
                  color: color1,
                ),
                border: InputBorder.none,
              ),
              onChanged: (s) {},
            ),
          ),
          FutureBuilder<String>(
            future: Future<String>.delayed(
              Duration(seconds: 1),
            ).then((e) {
              return "Success";
            }),
            builder: (context, futureData) {
              log("${futureData.connectionState}");
              if (futureData.connectionState != ConnectionState.done ||
                  !futureData.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              // print("^^^^^^^^${futureData.data}");

              return BlocBuilder<FluxPointsBloc, FluxPointsState>(
                builder: (context, state) {
                  if (state is FluxPointsInitialState) {
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (selectedCategories.contains(
                                        categories?[index].rewardCategoryID)) {
                                      setState(() {
                                        selectedCategories.remove(
                                            categories?[index]
                                                .rewardCategoryID);
                                        //   r = filterAccordingToCategory(
                                        // r, selectedCategories);
                                      });
                                    } else {
                                      setState(() {
                                        selectedCategories.add(
                                            categories?[index]
                                                    .rewardCategoryID ??
                                                "");
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      // width: 40,
                                      decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                        gradient: selectedCategories.contains(
                                                categories?[index]
                                                    .rewardCategoryID)
                                            ? RadialGradient(
                                                center: Alignment(0.8, 0.8),
                                                colors: [
                                                  Color(0xffB772EE),
                                                  Color(0xff7041EE),
                                                ],
                                                radius: 2,
                                              )
                                            : null,
                                        color: Color(0xffE9E9FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      // height: 5,
                                      margin: EdgeInsets.all(8),
                                      child: Text(
                                        categories?[index].name ?? "",
                                        style: GoogleFonts.montserrat(
                                          color: selectedCategories.contains(
                                                  categories?[index]
                                                      .rewardCategoryID)
                                              ? Colors.white
                                              : AppTheme.main,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: categories?.length,
                            ),
                            // color: Colors.pink,
                          ),
                          BlocBuilder<CouponsSearchBloc, CouponsSearchState>(
                            builder: (context, state) {
                              if (state is CouponsSearchInitial ||
                                  state is CouponsSearchStateLoading) {
                                return Center(
                                  child: Container(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              if (state is CouponsSearchError) {
                                return Center(
                                  child: Container(
                                    child: Text("rrr"),
                                  ),
                                );
                              }
                              if (state is CouponsSearchStateDone) {
                                List<Rewards> original = state.result;
                                print("${state.result}");
                                original = insertDistance(state.result);
                                if (j == 0) {
                                  r = original;
                                  j = 1;
                                }
                                return Column(
                                  children: [
                                    Container(
                                      // height: 500,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffE9E9FF),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  spreadRadius: 1,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                            margin: EdgeInsets.only(left: 20),
                                            padding: EdgeInsets.all(8),
                                            height: 50,
                                            width:MediaQuery.of(context).size.width*0.4,
                                            child: DropdownButton<String>(
                                              selectedItemBuilder: (context) {
                                                print(_choosenVal);
                                                print(
                                                    "###${_textEditingController.value.text.toString().length}");
                                                if (_choosenVal == "Sort") {
                                                  r = _textEditingController
                                                              .value.text
                                                              .toString()
                                                              .length !=
                                                          0
                                                      ? filterAccordingToSearchFavorites(
                                                          selectedCategories
                                                                      .length ==
                                                                  0
                                                              ? r.length !=
                                                                      original
                                                                          .length
                                                                  ? original
                                                                  : r
                                                              : filterAccordingToCategory(
                                                                  r,
                                                                  selectedCategories,
                                                                ),
                                                          _textEditingController
                                                              .value.text
                                                              .toString())
                                                      : selectedCategories
                                                                  .length ==
                                                              0
                                                          ? original
                                                          : filterAccordingToCategory(
                                                              r,
                                                              selectedCategories);
                                                } else if (_choosenVal ==
                                                    "Nearest Store") {
                                                  r = _textEditingController
                                                              .value.text
                                                              .toString()
                                                              .length !=
                                                          0
                                                      ? filterAccordingToSearchFavorites(
                                                          selectedCategories.length ==
                                                                  0
                                                              ? sortAccordingToDistance(selectedCategories.length ==
                                                                      0
                                                                  ? r.length !=
                                                                          original
                                                                              .length
                                                                      ? original
                                                                      : r
                                                                  : filterAccordingToCategory(
                                                                      r, selectedCategories))
                                                              : filterAccordingToCategory(
                                                                  r,
                                                                  selectedCategories,
                                                                ),
                                                          _textEditingController
                                                              .value.text
                                                              .toString())
                                                      : sortAccordingToDistance(
                                                          selectedCategories
                                                                      .length ==
                                                                  0
                                                              ? r.length !=
                                                                      original
                                                                          .length
                                                                  ? original
                                                                  : r
                                                              : filterAccordingToCategory(
                                                                  r, selectedCategories));
                                                } else if (_choosenVal ==
                                                    "Least Flux Points") {
                                                  r = _textEditingController
                                                              .value.text
                                                              .toString()
                                                              .length !=
                                                          0
                                                      ? filterAccordingToSearchFavorites(
                                                          selectedCategories.length ==
                                                                  0
                                                              ? sortAccordingToFluxPoints(selectedCategories.length ==
                                                                      0
                                                                  ? r.length !=
                                                                          original
                                                                              .length
                                                                      ? original
                                                                      : r
                                                                  : filterAccordingToCategory(
                                                                      r, selectedCategories))
                                                              : filterAccordingToCategory(
                                                                  r,
                                                                  selectedCategories,
                                                                ),
                                                          _textEditingController
                                                              .value.text
                                                              .toString())
                                                      : sortAccordingToFluxPoints(
                                                          selectedCategories
                                                                      .length ==
                                                                  0
                                                              ? r.length !=
                                                                      original
                                                                          .length
                                                                  ? original
                                                                  : r
                                                              : filterAccordingToCategory(
                                                                  r, selectedCategories));
                                                } else if (_choosenVal ==
                                                    "My favorite brand") {
                                                  r = _textEditingController
                                                              .value.text
                                                              .toString()
                                                              .length !=
                                                          0
                                                      ? filterAccordingToSearchFavorites(
                                                          selectedCategories
                                                                      .length !=
                                                                  0
                                                              ? filterAccordingToCategory(
                                                                  r,
                                                                  selectedCategories,
                                                                )
                                                              : r.length !=
                                                                      original
                                                                          .length
                                                                  ? original
                                                                  : r,
                                                          _textEditingController
                                                              .value.text
                                                              .toString())
                                                      : filterAccordingToFavorites(
                                                          selectedCategories
                                                                      .length ==
                                                                  0
                                                              ? r.length !=
                                                                      original
                                                                          .length
                                                                  ? original
                                                                  : r
                                                              : filterAccordingToCategory(
                                                                  r,
                                                                  selectedCategories,
                                                                ));
                                                }
                                                return [
                                                  Center(child: Container(width:100, child: Text("Sort",style:GoogleFonts.montserrat(fontSize: 24)))),
                                                  Center(child: Container(width:100, child: FittedBox(child: Text("Nearest Store",style:GoogleFonts.montserrat(fontSize: 24))))),
                                                  Center(child: Container(width: 100,child: FittedBox(child: Text("Least Flux Points",style:GoogleFonts.montserrat(fontSize: 24))))),
                                                  Center(child: Container(width:100,child: FittedBox(child: Text("My favorite brand",style:GoogleFonts.montserrat(fontSize: 24))))),
                                                ];
                                              },
                                              value: _choosenVal,
                                              underline: Container(),
                                              menuMaxHeight: 2000,
                                              style: GoogleFonts.montserrat(
                                                color: AppTheme.main,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                              dropdownColor:
                                                  Color(0xffE9E9FF),
                                              onChanged: (String? s) {
                                                setState(() {
                                                  _choosenVal = s ?? "";
                                                });
                                              },
                                              // iconSize:30,
                                              iconEnabledColor: AppTheme.main,
                                              icon: ImageIcon(
                                                AssetImage(
                                                  "assets/images/drop_down.png",
                                                ),
                                              ),
                                              //       Container(
                                              //   height: 24,
                                              //   child: FloatingActionButton(
                                              //     onPressed: null,
                                              //     shape: CircleBorder(
                                              //       side: BorderSide(
                                              //         color: AppTheme.main,
                                              //         width: 3,
                                              //       ),
                                              //     ),
                                              //     backgroundColor: Colors.white,
                                              //     mini: true,
                                              //     child: Icon(
                                              //       Icons.arrow_downward_outlined,
                                              //       color: AppTheme.main,
                                              //       size: 16,
                                              //     ),
                                              //   ),
                                              // ),
                                              hint: Text(
                                                "Sort",
                                                style: GoogleFonts.montserrat(
                                                  color: AppTheme.main,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              items: <String>[
                                                "Sort",
                                                "Nearest Store",
                                                "Least Flux Points",
                                                "My favorite brand"
                                              ].map<DropdownMenuItem<String>>(
                                                  (String s) {
                                                return DropdownMenuItem(
                                                  child: Text(s),
                                                  value: s,
                                                );
                                              }).toList(),
                                              isDense: false,
                                            ), //DropDownButton(),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.4,
                                            height: 80,
                                            child: FittedBox(
                                              child: Container(
                                              width: MediaQuery .of(context).size.width*0.4,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      minLeadingWidth: 10,
                                                      minVerticalPadding: 1,
                                                      horizontalTitleGap: 1,
                                                      // dense: true,
                                                      leading: Image.asset(
                                                        "assets/images/coin.png",
                                                        height: 40,
                                                      ),
                                                      title: Text(
                                                        "${fluxPointsBloc.getFluxPoints}",
                                                        style:
                                                            GoogleFonts.montserrat(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25,
                                                          color: AppTheme.main,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "My Points",
                                                      style: GoogleFonts.montserrat(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 20,
                                                        color: AppTheme.main,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // return
                                    Builder(
                                      builder: (context) => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        color: Colors.transparent,
                                        child: ListView.builder(
                                            itemCount: r.length,
                                            itemBuilder: (context, i) {
                                              log("${r.length}");
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BlocProvider.value(
                                                        value: fluxPointsBloc,
                                                        child:
                                                            CouponDetailScreen(
                                                          fluxPoints:
                                                              fluxPointsBloc
                                                                  .getFluxPoints,
                                                          rewardInfo: r[i],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(12),
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  // color: Colors.red,
                                                  child: Card(
                                                    elevation: 6,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Card(
                                                            elevation: 3,
                                                            margin:
                                                                EdgeInsets.zero,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    5,
                                                                  ),
                                                                ),
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    r[i].bannerImage!, // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLPQ-uicwyjCt0Va0FsnbI6cPzmVUmjM3HTA&usqp=CAU",
                                                                    scale: 0.01,
                                                                    // fit: BoxFit.fill,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                // shape: BoxShape.circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              2),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xffE9E9FF),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                        2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    "Valid until ${r[i].expiryDate}",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            10,
                                                                        color: AppTheme
                                                                            .main,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: 10,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.08,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        r[i].name!,
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              AppTheme.main,
                                                                          fontSize:
                                                                              10,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            2,
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.5,
                                                                        child:
                                                                            Text(
                                                                          r[i].shortDescription!,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.location_on,
                                                                              size: 12,
                                                                              color: AppTheme.main,
                                                                            ),
                                                                            Text(
                                                                              " " + r[i].distance.toString() + " km from your location.",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: GoogleFonts.montserrat(
                                                                                color: AppTheme.main,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.35,
                                                                  child:
                                                                      FittedBox(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.4,
                                                                      child:
                                                                          ListTile(
                                                                        minVerticalPadding:
                                                                            1,
                                                                        horizontalTitleGap:
                                                                            1,
                                                                        leading:
                                                                            Image.asset(
                                                                          "assets/images/coin.png",
                                                                          height:
                                                                              40,
                                                                        ),
                                                                        title:
                                                                            Text(
                                                                          r[i]
                                                                              .amount
                                                                              .toString(),
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize:
                                                                                25,
                                                                            color:
                                                                                AppTheme.main,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Text("error");
                              // ;
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  filterAccordingToCategory(
      List<Rewards> rewardsList, List<String> selectedCategories) {
    List<Rewards> filteredList = [];
    log("************$selectedCategories");
    rewardsList.forEach((element) {
      log("------${element.toJson()}");
      if (selectedCategories.contains(element.categoryID)) {
        filteredList.add(element);
        log("+++${element.toJson()}");
      }
    });

    return filteredList;
  }

  filterAccordingToSearchFavorites(List<Rewards> rewardsList, String query) {
    List<Rewards> sortedRewardsList = [];
    rewardsList.forEach((element) {
      log("@!#" +
          element.rewardPartnerName! +
          "      " +
          element.rewardPartnerID! +
          "      " +
          query +
          " " +
          favorites.toString());
      if (query
                  .toLowerCase()
                  .compareTo(element.rewardPartnerName!.toLowerCase()) ==
              0 &&
          favorites.contains(element.rewardPartnerID!)) {
        log("@!#" + query);
        sortedRewardsList.add(element);
        print(sortedRewardsList);
      }
    });
    return sortedRewardsList;
  }

  filterAccordingToFavorites(List<Rewards> rewardsList) {
    List<Rewards> sortedRewardsList = [];
    rewardsList.forEach((element) {
      // log("(_(__(_(_(_(_(_(__(_ ${element.rewardPartner}")
      if (favorites.contains(element.rewardPartnerID!)) {
        sortedRewardsList.add(element);
      }
    });
    return sortedRewardsList;
  }

  sortAccordingToDistance(List<Rewards> rewardsList) {
    List<Rewards> sortedRewardsList = rewardsList;
    sortedRewardsList
        .sort((Rewards a, Rewards b) => (a.distance! < b.distance!) ? 0 : 1);
    return sortedRewardsList;
  }

  sortAccordingToFluxPoints(List<Rewards> rewardsList) {
    List<Rewards> sortedRewardsList = rewardsList;
    sortedRewardsList
        .sort((Rewards a, Rewards b) => (a.amount! < b.amount!) ? 0 : 1);
    return sortedRewardsList;
  }

  insertDistance(List<Rewards> reward) {
    var usrLoc_Long = _locationData.longitude ?? 0.0;
    var usrLoc_Lat = _locationData.latitude ?? 0.0;
    var p = 0.017453292519943295;
    var c = cos;
    reward.forEach((element) {
      var a = 0.5 -
          c((element.latitude! - usrLoc_Lat) * p) / 2 +
          c(usrLoc_Lat * p) *
              c(element.latitude! * p) *
              (1 - c((element.longitude! - usrLoc_Long) * p)) /
              2;
      element.distance =
          double.parse((12742 * asin(sqrt(a))).toStringAsFixed(3));
    });
    log("LAt: $usrLoc_Lat    LOng: $usrLoc_Long");
    log("rLat: ${reward[0].latitude}   rLong: ${reward[0].longitude}");
    log("&--766---^---&---${reward[0].distance}");
    return reward;
  }
}
