import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/screens/coupon_details.dart';
import 'package:flux_payments/services/database_lambda.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardsSearchScreen extends StatefulWidget {
  const RewardsSearchScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: backButton(context, "button1"),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Flux.",
                style: GoogleFonts.montserrat(
                  fontSize: size.height * 0.07,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradientText,
                  // textStyle:
                  //     TextStyle(color: Colors.blue, letterSpacing: .5),
                ),
              ),
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
              child: TextField(
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
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: DatabaseLambdaService().getCategories(),
              builder: (context, futureData) {
                if (!futureData.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                log("^^^^^^^^${futureData.data}");

                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (selectedCategories.contains(futureData
                                      .data?[index]["rewardCategoryID"])) {
                                    setState(() {
                                      selectedCategories.remove(futureData
                                          .data?[index]["rewardCategoryID"]);
                                    });
                                  } else {
                                    setState(() {
                                      selectedCategories.add(futureData
                                          .data?[index]["rewardCategoryID"]);
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  // width: 40,
                                  decoration: BoxDecoration(
                                    gradient: selectedCategories.contains(
                                            futureData.data?[index]
                                                ["rewardCategoryID"])
                                        ? RadialGradient(
                                            colors: [
                                              Color(0xffB772EE),
                                              Color(0xff7041EE)
                                            ],
                                          )
                                        : null,
                                    color: Color(0xffE9E9FF),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  // height: 5,
                                  margin: EdgeInsets.all(8),
                                  child: Text(
                                    futureData.data?[index]["name"],
                                    style: GoogleFonts.montserrat(
                                      color: selectedCategories.contains(
                                              futureData.data?[index]
                                                  ["rewardCategoryID"])
                                          ? Colors.white
                                          : AppTheme.main,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: futureData.data?.length,
                          ),
                          // color: Colors.pink,
                        ),
                        Container(
                          // height: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: DropdownButton(
                                  icon: Container(
                                    height: 24,
                                    child: FloatingActionButton(
                                      onPressed: null,
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: AppTheme.main,
                                          width: 3,
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      mini: true,
                                      child: Icon(
                                        Icons.arrow_downward_outlined,
                                        color: AppTheme.main,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  // CircleAvatar(
                                  //   child: Icon(
                                  //     Icons.arrow_downward,
                                  //     color: AppTheme.main,
                                  //   ),
                                  //   backgroundColor: Colors.white,
                                  // ),
                                  hint: Text(
                                    "Sort",
                                    style: GoogleFonts.montserrat(
                                      color: AppTheme.main,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  items: [],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      minVerticalPadding: 1,
                                      horizontalTitleGap: 1,
                                      leading: Image.asset(
                                        "assets/images/coin.png",
                                        height: 40,
                                      ),
                                      title: Text(
                                        "20000",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: AppTheme.main,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "My Coins",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: AppTheme.main,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          color: Colors.transparent,
                          child: ListView.builder(
                              itemBuilder: (context, i) => InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CouponDetailScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(12),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      // color: Colors.red,
                                      child: Card(
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.165,
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLPQ-uicwyjCt0Va0FsnbI6cPzmVUmjM3HTA&usqp=CAU",
                                                        scale: 0.01,
                                                        // fit: BoxFit.fill,
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    // shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffE9E9FF),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            2,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Valid until 01-Jun-2021",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 10,
                                                                color: AppTheme
                                                                    .main,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, top: 3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "BurgerKing",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color:
                                                                AppTheme.main,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          "BurgerKing",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        // Text("BurgerKing"),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      width: 150,
                                                      child: ListTile(
                                                        minVerticalPadding: 1,
                                                        horizontalTitleGap: 1,
                                                        leading: Image.asset(
                                                          "assets/images/coin.png",
                                                          height: 40,
                                                        ),
                                                        title: Text(
                                                          "200",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25,
                                                            color:
                                                                AppTheme.main,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              itemCount: 5),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
