import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/service_provider_page.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';

class ServiceProviderCategory extends StatefulWidget {
  final Map<String, dynamic> paymentData;
  final User user;
  const ServiceProviderCategory(
      {Key? key, required this.paymentData, required this.user})
      : super(key: key);

  @override
  _ServiceProviderCategoryState createState() => _ServiceProviderCategoryState();
}

class _ServiceProviderCategoryState extends State<ServiceProviderCategory> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 2,
                              horizontal: SizeConfig.heightMultiplier * 1),
                          // color: Colors.amber,
                          // height: SizeConfig.heightMultiplier*12,
                          // width: SizeConfig.widthMultiplier*100,

                          child: Image.asset(
                            "assets/icons/backButton.png",
                            scale: 1.6,
                          ),
                          //  child:NetworkImage(widget.user.);
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          //color: Colors.amber,
                          height: SizeConfig.heightMultiplier * 2.4,
                          //   child:
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
                      ],
                    ),
                  ],
                ),

                Container(
                  height: SizeConfig.heightMultiplier * 9,
                  width: SizeConfig.widthMultiplier * 97,
                  //  decoration: BoxDecoration(color: AppTheme.main),
                  child: Row(
                    children: [
                      Padding(
                        padding:    EdgeInsets.symmetric(
                                horizontal:SizeConfig.widthMultiplier * 1,
                                vertical: SizeConfig.heightMultiplier * 0.2),
                        child: Text(
                          'My Providers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,

                          ),
                          
                        ),
                      ),
                      // Spacer(),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.all(SizeConfig.heightMultiplier * 1.5),
                      //   child: Container(
                      //     // height: SizeConfig.heightMultiplier*12,
                      //     // width: SizeConfig.widthMultiplier*100,

                      //     child: Image.asset("assets/images/av.png"),
                      //     //  child:NetworkImage(widget.user.);
                      //   ),
                      // ),
                    ],
                  ),
                ),
             
                // SizedBox(
                //   height: SizeConfig.heightMultiplier * 0.09,
                // ),
                 Container(
                            height: SizeConfig.heightMultiplier *6,
                            width:SizeConfig.widthMultiplier*91,
                            padding: EdgeInsets.symmetric(
                                horizontal:SizeConfig.widthMultiplier * 1,
                                vertical: SizeConfig.heightMultiplier * 0.2),
                            margin: EdgeInsets.fromLTRB(0, SizeConfig.heightMultiplier  * 1, 0, 0),
                            decoration: BoxDecoration(
                              boxShadow:
                                  //kElevationToShadow[4],
                                  [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: SizeConfig.widthMultiplier * 0.5,
                                  spreadRadius: SizeConfig.widthMultiplier * 0.05,
                                  offset: Offset(SizeConfig.widthMultiplier * 0.7, SizeConfig.heightMultiplier * 0.5),
                                ),
                              ],
                              border: Border.all(
                                color: AppTheme.main,
                              ),
                              borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier *3),
                              color: AppTheme.offWhite,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: AppTheme.main,
                                  fontSize:SizeConfig.heightMultiplier * 2.4,
                                ),
                                hintText: "Search for my favorite brand",
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: SizeConfig.heightMultiplier * 4.5,
                                  color: AppTheme.main,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          //),
                          SizedBox(
                            height: SizeConfig.heightMultiplier* 2,
                          ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

                /////////////
                  SizedBox(
                            height: SizeConfig.heightMultiplier * 1.5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5,),
                            child: Column(
                             
                              children: [
                                Row(
                               
                                  children: [
                              
                                    billCategories(
                                      "Food",
                                      "assets/images/food.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                     widget.user,
                                    ),
                                    SizedBox(
                                 width: SizeConfig.widthMultiplier*3,
                                ),
                                    billCategories(
                                      "Fashion",
                                      "assets/images/fashion.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                         SizedBox(
                                  width: SizeConfig.widthMultiplier*3,
                                ),
                                    billCategories(
                                      "Fitness",
                                      "assets/images/fitness.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                                   SizedBox(
                                  width: SizeConfig.widthMultiplier*3,
                                ),
                                    billCategories(
                                      "Entertainment",
                                      "assets/images/entertainment.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                                  //   Spacer(),
                                  ],
                                ),
                              SizedBox(
                              height: SizeConfig.widthMultiplier*100 * 0.015,
                            ),
                            
                            Row(
                            
                              children: [
                             
                                    billCategories(
                                      "Food",
                                      "assets/images/food.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                                    SizedBox(
                                  width: SizeConfig.widthMultiplier*3,
                                ),
                                    billCategories(
                                      "Fashion",
                                      "assets/images/fashion.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                         SizedBox(
                                 width: SizeConfig.widthMultiplier*3,
                                ),
                                    billCategories(
                                      "Fitness",
                                      "assets/images/fitness.svg",
                                      SizeConfig.heightMultiplier*100,
                                     SizeConfig.widthMultiplier*100,
                                      widget.user,
                                    ),
                                   SizedBox(
                                 width: SizeConfig.widthMultiplier*3,
                                ),
                              ],
                            ),
                       
                              ],
                            ),
                          ),
                         
                          SizedBox(
                            height: SizeConfig.heightMultiplier*100 * 0.02,
                          ),
              
                // Padding(
                //   padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                //   child: Align(
                //       alignment: Alignment.centerLeft,
                //       child: Text(
                //         "Detailed Bill",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       )),
                // ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget billCategories(String title, String img, double height, double width,User user) {
    return InkWell(
      child: Container(
        child: Column(
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
                  color:AppTheme.main,
                  fit: BoxFit.scaleDown,
                ),
                backgroundColor: AppTheme.offWhite,
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
        ),
      ),
    onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return ServiceProviderPage(
                                    serviceName:'Credit Card', user: user);
                                // return GraphScreen(graphData: widget.mp, user: widget.user);
                              }));
              },
    );
  }
}
