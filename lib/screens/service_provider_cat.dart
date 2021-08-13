import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_event.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/screens/service_provider_page.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';

class ServiceProviderCategory extends StatefulWidget {
  final Map<String, dynamic> paymentData;
  final User user;
  final DatabaseRepository? databaseRepository;
  const ServiceProviderCategory({
    Key? key,
    required this.paymentData,
    required this.user,
    required this.databaseRepository,
  }) : super(key: key);

  @override
  _ServiceProviderCategoryState createState() =>
      _ServiceProviderCategoryState();
}

class _ServiceProviderCategoryState extends State<ServiceProviderCategory> {
  @override
  Widget build(BuildContext context) {
    var serviceProviderBloc = BlocProvider.of<ServiceProviderBloc>(context);
    serviceProviderBloc.add(GetServiceCategoryDetails());

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
                            child: fluxLogo(context),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 1,
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
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 91,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 1,
                      vertical: SizeConfig.heightMultiplier * 0.2),
                  margin: EdgeInsets.fromLTRB(
                      0, SizeConfig.heightMultiplier * 1, 0, 0),
                  decoration: BoxDecoration(
                    boxShadow:
                        //kElevationToShadow[4],
                        [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: SizeConfig.widthMultiplier * 0.5,
                        spreadRadius: SizeConfig.widthMultiplier * 0.05,
                        offset: Offset(SizeConfig.widthMultiplier * 0.7,
                            SizeConfig.heightMultiplier * 0.5),
                      ),
                    ],
                    border: Border.all(
                      color: AppTheme.main,
                    ),
                    borderRadius:
                        BorderRadius.circular(SizeConfig.widthMultiplier * 3),
                    color: AppTheme.offWhite,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: AppTheme.main,
                        fontSize: SizeConfig.heightMultiplier * 2.4,
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
                  height: SizeConfig.heightMultiplier * 2,
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

                BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
                  buildWhen: (previous, current) {
                    if (current is LoadServiceCategoryListState ||
                        current is LoadingServiceCategoryListState ||
                        current is ErrorServiceCategoryListState)
                      return true;
                    else
                      return false;
                  },
                  builder: (context, state) {
                    //     serviceProviderBloc.add(InsertCreditCardDetails(creditCardNumber:'121111', expiryDate: '00/11', bankName: 'ddd', cvv: '112', holderName: 'unknonwn', userID: 'flux-vid1', billProviderID: 'BillProvid_X102'));

                    if (state is LoadingServiceCategoryListState)
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.main,
                        ),
                      );

                    if (state is LoadServiceCategoryListState) {
                      print('opppppppp');
                      print(state.ServiceCategoryList);
                      List<Map<String, String>> ServiceCategoryList =
                          state.ServiceCategoryList;
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // billCategories(
                                //   "Food",
                                //   "assets/images/food.svg",
                                //   SizeConfig.heightMultiplier * 100,
                                //   SizeConfig.widthMultiplier * 100,
                                //   widget.user, width: null,
                                // ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[0]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[0]['name'] ?? '',
                                    img: ServiceCategoryList[0]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[1]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[1]['name'] ?? '',
                                    img: ServiceCategoryList[1]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[2]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[2]['name'] ?? '',
                                    img: ServiceCategoryList[2]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[3]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[3]['name'] ?? '',
                                    img: ServiceCategoryList[3]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                //   Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.widthMultiplier * 100 * 0.015,
                            ),
                            Row(
                              children: [
                                billCategories(
                                    billCategoryID: ServiceCategoryList[4]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[4]['name'] ?? '',
                                    img: ServiceCategoryList[4]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[5]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[5]['name'] ?? '',
                                    img: ServiceCategoryList[5]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                                billCategories(
                                    billCategoryID: ServiceCategoryList[6]
                                            ['billCategoryID'] ??
                                        '',
                                    title: ServiceCategoryList[6]['name'] ?? '',
                                    img: ServiceCategoryList[6]['icon'] ?? '',
                                    height: SizeConfig.heightMultiplier * 100,
                                    width: SizeConfig.widthMultiplier * 100,
                                    user: widget.user,
                                    serviceProviderBloc: serviceProviderBloc),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is ErrorServiceCategoryListState) {
                      return Center(
                        child: Text((state).message),
                      );
                    }
                    if (state is ServiceProviderInitialState)
                      return Center(
                        child: Text('unable to fire event!'),
                      );
                    else {
                      return Text(state.toString());
                    }
                  },
                ),

                SizedBox(
                  height: SizeConfig.heightMultiplier * 100 * 0.02,
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

  Widget billCategories(
      {required String billCategoryID,
      required String title,
      required String img,
      required double height,
      required double width,
      required User user,
      required var serviceProviderBloc}) {
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
                child: Container(
                  child: Image.network(img, height: height * .055),
                ),
                //  foregroundImage: NetworkImage(img,scale: 0.1),
                // SvgPicture.asset(
                //   img,
                //   //alignment: Alignment.center,
                //   height: height * 0.06,
                //   color: AppTheme.main,
                //   fit: BoxFit.scaleDown,
                // ),
                //  backgroundImage: NetworkImage(img,scale:1.4),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider<ServiceProviderBloc>.value(
            value: serviceProviderBloc,
            child: ServiceProviderPage(
                categoryName: title, categoryID: billCategoryID, user: user),
          );
          // return GraphScreen(graphData: widget.mp, user: widget.user);
        }));
      },
    );
  }
}
