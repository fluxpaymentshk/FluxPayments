import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flux_payments/bloc/coupons_bloc/coupons_bloc.dart';
import 'package:flux_payments/bloc/coupons_bloc/coupons_event.dart';
import 'package:flux_payments/bloc/coupons_bloc/coupons_state.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_event.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_state.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_bloc.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/RewardCategory.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/screens/card.dart';
import 'package:flux_payments/screens/couponList.dart';
import 'package:flux_payments/repository/favorite_search_repository.dart';
import 'package:flux_payments/screens/rewards_search_screen.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:qr_flutter/qr_flutter.dart';

import './animation.dart';

class Coupons extends StatefulWidget {
  static const routeName = '/coupons';
  final DatabaseRepository? databaseRepo;

  const Coupons({
    Key? key,
    @required this.databaseRepo,
  }) : super(key: key);

  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  // List<Map> fav = [
  //   {'url': 'assets/images/adidas.png', 'title': 'adidas'},
  //   {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
  //   {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
  //   {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
  //   {'url': 'assets/images/hnm.png', 'title': 'H & M'},
  //   {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
  //   // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
  //   // {'url': 'assets/images/adidas.png', 'title': 'adidas'},
  //   // {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
  //   // {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
  //   // {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
  //   // {'url': 'assets/images/hnm.png', 'title': 'H & M'},
  //   // {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
  //   // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
  //   // {'url': 'assets/images/adidas.png', 'title': 'adidas'},
  //   // {'url': 'assets/images/airbnb.png', 'title': 'Airbnb'},
  //   // {'url': 'assets/images/coldstone.png', 'title': 'Cold Stone'},
  //   // {'url': 'assets/images/fl.png', 'title': 'Foot Lock'},
  //   // {'url': 'assets/images/hnm.png', 'title': 'H & M'},
  //   // {'url': 'assets/images/ikea.png', 'title': 'Ikea'},
  //   // {'url': 'assets/images/mcd.png', 'title': 'MC Donalds'},
  // ];

  //var color = (Colors.deepPurple[50]);
  List<List<Color>> colors = [
    [Color(0xFFFDD819), Color(0xFFE80505)],
    [Color(0xFFF0FF00), Color(0xFF58CFFB)],
    [Color(0xFFFFF3B0), Color(0xFFCA26FF)],
    [Color(0xFFFDEB71), Color(0xFFF8D800)],
    [Color(0xFFFFCF71), Color(0xFF2376DD)],
  ];
  List<Reward> fav = [];
  ScrollController controller = ScrollController();
  List<myCoupons> coupons = [];
  var expand = true;
  late List<Widget> listItems;
  var height;
  var width;
  double topContainer = 0;
  //bool closeTopContainer = false;
  bool loadAllFav = false;
  var color1 = Color(0xFF7041EE);
  var color = Color(0xFFE9E9FF);
  bool show = true;
  var bordercolor = (Colors.grey[700])!;
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));

  // void getfavdata() {
  //   if (fav.length < 10) {
  //     fav = fav.sublist(0, fav.length);
  //   } else {
  //     fav = fav.sublist(0, 10);
  //   }
  //   print(fav.length);
  // }
  List<RewardCategory> categories = [];
  @override
  void initState() {
    super.initState();
    getCategoryList();
    //getfavdata();
    controller.addListener(() {
      // if (controller.offset > height * 0.18 * 0.6) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => CouponsList(
      //             coupons,
      //           )));
      // }

      //   setState(() {
      //     double value = controller.offset / (height * 0.18 * 0.6);
      //     topContainer = value;
      //     if (controller.offset > 1) {
      //       //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CouponsList(coupons,)));
      //       //expand = false;
      //     } else {
      //       //expand = true;
      //     }
      //     //closeTopContainer = controller.offset > 100;
      //   });
    });
  }

  void getCategoryList() async {
    categories = await DatabaseLambdaService().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    var favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    var couponsBloc = BlocProvider.of<CouponsBloc>(context);
    final DatabaseRepository databaseRepo = DatabaseRepository();
    final CouponsSearchRepository _couponSearchRepository =
        CouponsSearchRepository();
    userBloc.add(GetUserDetails(userID: 'fluxsam1'));
    favoritesBloc
        .add(GetFavorites(page: 0, userID: 'fluxsam1', favorites: fav));
    couponsBloc.add(GetCoupons(page: 0, userID: 'fluxsam1', coupons: coupons));

    Size size = MediaQuery.of(context).size;

    setState(() {
      height = size.height;
      width = size.width;
    });
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserDetailsLoading) {
          print("State is UserDetailsLoading");
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.black,
              //color: AppTheme.main,
            ),
          );
        } else if (state is UserDetails) {
          print("State is UserDetails");
          databaseRepo.getUserDetails(userID: "fluxsam1");

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ExpandedSection(
                    //   expand: expand,
                    //   child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Flux.",
                            style: GoogleFonts.montserrat(
                              fontSize: height * 0.07,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradientText,
                              // textStyle:
                              //     TextStyle(color: Colors.blue, letterSpacing: .5),
                            ),
                          ),
                        ),
                        // Material(
                        //   elevation: 5,
                        //   child:
                        Container(
                          height: height * 0.06,
                          width: width * 0.91,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.002),
                          margin: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
                          decoration: BoxDecoration(
                            boxShadow:
                                //kElevationToShadow[4],
                                [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: width * 0.005,
                                spreadRadius: width * 0.0005,
                                offset: Offset(width * 0.007, height * 0.005),
                              ),
                            ],
                            border: Border.all(
                              color: color1,
                            ),
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: color,
                          ),
                          // child: TextField(
                          //   decoration: InputDecoration(
                          //     hintStyle: TextStyle(
                          //       color: color1,
                          //       fontSize: height * 0.024,
                          //     ),
                          //     borderRadius: BorderRadius.circular(width * 0.03),
                          //     color: color,
                          //   ),
                            child: GestureDetector(
                              onTap: () {
                                print(
                                    "_+++__________++++++++++++++_________${widget.databaseRepo}");
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider<CouponsSearchBloc>(
                                          create: (_) => CouponsSearchBloc(
                                              _couponSearchRepository),
                                        ),
                                        BlocProvider(
                                          create: (_) => FluxPointsBloc(
                                            widget.databaseRepo!,
                                          ),
                                        ),
                                        BlocProvider.value(
                                          value: favoritesBloc,
                                        ),
                                      ],
                                      child: RewardsSearchScreen(
                                        categories: categories,
                                        favorites: fav,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: color1,
                                    fontSize: height * 0.024,
                                  ),
                                  hintText: "Search for my favorite brand",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: height * 0.045,
                                    color: color1,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                              //border: InputBorder.none,
                            ),
                          ),
                        //),
                        //),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          child: Text(
                            "Category",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            catagories(
                              "Food",
                              "assets/images/food.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Fashion",
                              "assets/images/fashion.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Fitness",
                              "assets/images/fitness.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Entertainment",
                              "assets/images/entertainment.svg",
                              height,
                              width,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            catagories(
                              "Museum",
                              "assets/images/museum.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Logistics",
                              "assets/images/logistics.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Travel",
                              "assets/images/travel.svg",
                              height,
                              width,
                            ),
                            catagories(
                              "Grocery",
                              "assets/images/grocery.svg",
                              height,
                              width,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Favorites",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         loadAllFav = !loadAllFav;
                            //       });
                            //     },
                            //     icon: Icon(loadAllFav
                            //         ? Icons.upload
                            //         : Icons.download))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.018,
                        ),
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
                              if (fav.length < 10) {
                                fav = fav.sublist(0, fav.length);
                              } else {
                                fav = fav.sublist(0, 10);
                              }
                              return
                                  //fav.length == 0 ? Text("Please mark some favorites !") :
                                  Container(
                                //height: fav.length > 5 && loadAllFav ? height * 0.318 : height * 0.21,
                                height: fav.length > 5 && loadAllFav
                                    ? height * 0.259
                                    : height * 0.148,
                                padding: EdgeInsets.fromLTRB(
                                    width * 0.01,
                                    height * 0.016,
                                    width * 0.01,
                                    height * 0.01),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.03),
                                ),
                                child: Column(
                                  children: [
                                    favContainer(0, min(fav.length, 5)),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    if (fav.length >= 5 && loadAllFav)
                                      favContainer(5, min(fav.length, 10)),
                                    // IconButton(onPressed: (){
                                    //   setState(() {
                                    //     loadAllFav =! loadAllFav;
                                    //   });
                                    // }, icon: Icon(Icons.file_upload))
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                child: Text("No Favorites found !"
                                    //(state as ErrorFavorites).message
                                    ??
                                    ''),
                              );
                            }
                          },
                        ),

                        SizedBox(
                          height: height * 0.018,
                        ),
                      ],
                    ),
                    //),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      child: Text(
                        "My Coupon",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (expand)
                      SizedBox(
                        height: height * 0.02,
                      ),
                    BlocBuilder<CouponsBloc, CouponsState>(
                        builder: (context, state) {
                      if (state is LoadingCoupons) {
                        print("State is LoadingCoupons");
                        return CircularProgressIndicator(
                          strokeWidth: 5.0,
                          color: Colors.black,
                          //color: AppTheme.main,
                        );
                      } else if (state is LoadedCoupons) {
                        print("State is LoadedCoupons");
                        print(state.coupons);
                        coupons = state.coupons;
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: min(height * 0.25 * 0.55 * coupons.length,
                              height * 0.3),
                          //! Change height
                          //height: !expand ? height * 0.2 : height * 0.18 * 14 * 0.7 + height * 0.18,
                          //height: expand ? height * 0.3 : height,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      controller: controller,
                                      itemCount: 5,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        double scale = 1.0;
                                        if (topContainer > 0.5) {
                                          scale = index + 0.5 - topContainer;
                                          if (scale < 0) {
                                            scale = 0;
                                          } else if (scale > 1) {
                                            scale = 1;
                                          }
                                        }
                                        return Opacity(
                                          opacity: scale,
                                          child: Transform(
                                            transform: Matrix4.identity()
                                              ..scale(scale, scale),
                                            alignment: Alignment.bottomCenter,
                                            child: Align(
                                              heightFactor: 0.55,
                                              alignment: Alignment.topCenter,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CouponsList(
                                                                coupons,
                                                              )));
                                                },
                                                child: CouponCard(
                                                    coupons[index],
                                                    colors[index % 5]),
                                              ),
                                              // child: card(
                                              //   coupons[index],
                                              //   colors[index%5],
                                              //   height,
                                              //   width,
                                              // ),
                                            ),
                                          ),
                                        );
                                      })),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          color: Colors.black,
                          height: 100,
                        );
                      }
                    }),
                    SizedBox(
                      height: height * 0.01,
                    )
                  ],
                ),
              ),
            ),
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
            width: width * 0.18,
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
                        spreadRadius: width * 0.005,
                        blurRadius: width * 0.005,
                        offset: Offset(width * 0.007, height * 0.005),
                      ),
                    ],
                  ),
                  height: height * 0.075,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://img.etimg.com/thumb/msid-59738997,width-640,resizemode-4,imgsize-21421/nike.jpg",
                    ),
                    backgroundColor: color,
                    radius: height * 0.11,
                  ),
                ),
                SizedBox(
                  height: height * 0.009,
                ),
                Center(
                  child: Text(
                    e.name.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: height * 0.022,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList());
  }

  Widget catagories(String title, String img, double height, double width) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: width * 0.005,
                blurRadius: width * 0.01,
                offset: Offset(width * 0.007, height * 0.005),
              ),
            ],
          ),
          child: CircleAvatar(
            child: SvgPicture.asset(
              img,
              //alignment: Alignment.center,
              height: height * 0.06,
              color: color1,
              fit: BoxFit.scaleDown,
            ),
            backgroundColor: color,
            radius: height * 0.04,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        SizedBox(
          width: width * 0.2,
          child: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: height * 0.023),
            overflow: TextOverflow.ellipsis,
          )),
        )
      ],
    );
  }

  Widget card(myCoupons coupon, List<Color> linearGradientCard, double height,
      double width) {
    return CustomPaint(
      foregroundPainter: TimelinePainter(context, height * 0.42, width * 0.1),
      child: ClipPath(
        //clipper: DolDurmaClipper(height * 0.42, width * 0.1),
        child: Container(
          height: height * 0.22 + width * 0.6,
          //height: height * 0.19,
          width: width * 0.92,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.03),
              gradient: LinearGradient(
                stops: [0.3, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: linearGradientCard,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.035, height * 0.01, width * 0.035, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      coupon.name ?? "Name",
                      style: TextStyle(fontSize: height * 0.023),
                    ),
                    //Image.network(src);
                    Image.network(
                      coupon.image ?? "assets/images/Lego.png",
                      height: height * 0.03, //20,
                      width: width * 0.1, //40,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    coupon.shortDescription ?? "Offer to be added later",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.002, width * 0.05, 0),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.003, horizontal: width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Valid until ${coupon.validUntill}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * 0.017,
                    color: Colors.red,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.04, width * 0.05, 0),
                child: Text(
                  "The coupon cannot be used in Airport branch, IFC mail branch and K11 MUSEA",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  //height: width*0.6,
                  width: width * 0.6,
                  child: QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    //size: width*0.6,
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

// class DolDurmaClipper extends CustomClipper<Path> {
//   DolDurmaClipper(this.right, this.holeRadius);

//   final double right;
//   final double holeRadius;

//   @override
//   Path getClip(Size size) {
//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(0.0, size.height - right - holeRadius)
//       ..arcToPoint(
//         Offset(0, size.height - right),
//         clockwise: true,
//         radius: Radius.circular(1),
//       )
//       ..lineTo(0.0, size.height)
//       ..lineTo(size.width, size.height)
//       ..lineTo(size.width, size.height - right)
//       ..arcToPoint(
//         Offset(size.width, size.height - right - holeRadius),
//         clockwise: true,
//         radius: Radius.circular(1),
//       );

//     path.lineTo(size.width, 0.0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(DolDurmaClipper oldClipper) => true;
// }

class TimelinePainter extends CustomPainter {
  TimelinePainter(
    this.context,
    this.right,
    this.holeRadius,
  );
  final right;
  final holeRadius;
  BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    // print('size of canvas= h${size.height} & w${size.width}');
    var path = Path();

    path.moveTo(
        holeRadius / 2, size.height - right - holeRadius + holeRadius / 2);
    path.lineTo(size.width - holeRadius / 2,
        size.height - right - holeRadius + holeRadius / 2);

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([15.0, 7.0])), paint);

    final path1 = Path()
      ..moveTo(0.0, size.height - right - holeRadius)
      //..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - right),
        clockwise: true,
        radius: Radius.circular(1),
      );
    path1.close();
    var paint1 = Paint();
    paint1.color = Colors.white;
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 2;
    canvas.drawPath(path1, paint1);

    final path2 = Path()
      ..moveTo(size.width, size.height - right)
      //..lineTo(0.0, size.height - right - holeRadius)
      ..arcToPoint(
        Offset(size.width, size.height - right - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );
    path2.close();
    var paint2 = Paint();
    paint2.color = Colors.white;
    paint2.style = PaintingStyle.fill;
    paint2.strokeWidth = 2;
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter delegate) {
    return false;
  }
}
