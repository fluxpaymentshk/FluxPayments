import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_event.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/add_credit_card.dart';
import 'package:flux_payments/screens/add_tax.dart';
import 'package:flux_payments/screens/provider_added.dart';
import 'package:flux_payments/widgets/recent_payment_tile.dart';
import 'package:flux_payments/widgets/service_provider_tile.dart';

import 'add_bank.dart';
import 'add_telecom.dart';
import 'add_electricity_bill.dart';

class ServiceProviderPage extends StatefulWidget {
  final User user;
  final String categoryName;
  final String categoryID;
  const ServiceProviderPage(
      {required this.user,
      required this.categoryName,
      required this.categoryID,
      Key? key})
      : super(key: key);

  @override
  _ServiceProviderPageState createState() => _ServiceProviderPageState();
}

class _ServiceProviderPageState extends State<ServiceProviderPage> {
  @override
  Widget build(BuildContext context) {
    var serviceProvierBloc = BlocProvider.of<ServiceProviderBloc>(context);

    serviceProvierBloc.add(
        GetServiceProviderCategoryDetails(billCategoryID: widget.categoryID));
    return Scaffold(
      body: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: Column(children: [
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
            Container(
              height: SizeConfig.heightMultiplier * 6,
              width: SizeConfig.widthMultiplier * 91,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 1,
                  vertical: SizeConfig.heightMultiplier * 0.2),
              margin:
                  EdgeInsets.fromLTRB(0, SizeConfig.heightMultiplier * 1, 0, 0),
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

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 3,
                      vertical: SizeConfig.heightMultiplier * 0.2),
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
                buildWhen: (previous, current) {
              return (current is LoadServiceProviderListState ||
                  current is LoadingServiceProviderListState ||
                  current is ErrorServiceProviderListState);
            }, builder: (context, state) {
              if (state is LoadingServiceProviderListState)
                return Center(
                    child: CircularProgressIndicator(color: AppTheme.main));

              if (state is LoadServiceProviderListState) {
                List<Map<String, String>> ServiceProviderList =
                    state.ServiceProviderList;
                return (ServiceProviderList.length != 0)
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 3,
                          vertical: SizeConfig.heightMultiplier * 2.3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.heightMultiplier * 2)),
                          border: Border.all(color: AppTheme.main, width: 1.0),
                        ),
                        height: min(
                            SizeConfig.heightMultiplier *
                                6 *
                                ServiceProviderList.length,
                            SizeConfig.heightMultiplier * 6 * 10),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return
                                  //to expp
                                  InkWell(
                                child: serviceProviderTile(
                                  name:
                                      ServiceProviderList[index]['name'] ?? '',
                                  // paidOn: '',
                                  imageurl:
                                      ServiceProviderList[index]['logo'] ?? '',
                                  //  id:ServiceProviderList[index]['billProviderID']??'',
                                  //  amount: 100,
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                //    return ProviderAdded();
                                    return BlocProvider<
                                        ServiceProviderBloc>.value(
                                      value: serviceProvierBloc,
                                      child:

                                      //     ServiceProviderPage(categoryName: title, categoryID: billCategoryID, user: user),
                                           (ServiceProviderList[index]
                                                 ['name']!.contains('credit card')==true)
                                           ?
                                      AddCreditCard(
                                        name: ServiceProviderList[index]
                                                ['name'] ??
                                            '',
                                        logo: ServiceProviderList[index]
                                                ['logo'] ??
                                            '',
                                        billProviderID:
                                            ServiceProviderList[index]
                                                    ['billProviderID'] ??
                                                '',
                                      )
                                      :

                                       (ServiceProviderList[index]
                                                 ['name']!.contains('tax'))
                                     ?
                                       AddTax(
                                        name: ServiceProviderList[index]
                                                ['name'] ??
                                            '',
                                        logo: ServiceProviderList[index]
                                                ['logo'] ??
                                            '',
                                        billProviderID:
                                            ServiceProviderList[index]
                                                    ['billProviderID'] ??
                                                '',
                                        billCategoryID:widget.categoryID,
                                      )

                                         :(ServiceProviderList[index]
                                                 ['name']!.contains('telecom'))
                                             ?

                                           AddTelecom(
                                        name: ServiceProviderList[index]
                                                ['name'] ??
                                            '',
                                        logo: ServiceProviderList[index]
                                                ['logo'] ??
                                            '',
                                        billProviderID:
                                            ServiceProviderList[index]
                                                    ['billProviderID'] ??
                                                '',
                                                billCategoryID:widget.categoryID,
                                      )
                                            :(ServiceProviderList[index]
                                                ['name']!.contains('electricitybill'))
                                             ?
                                            AddElectricityBill(

                                        name: ServiceProviderList[index]
                                                ['name'] ??
                                            '',
                                        logo: ServiceProviderList[index]
                                                ['logo'] ??
                                            '',
                                        billProviderID:
                                            ServiceProviderList[index]
                                                    ['billProviderID'] ??
                                                '',
                                                billCategoryID:widget.categoryID,
                                      )
                                       :
                                    // (ServiceProviderList[index]
                                    //  ['name']!.contains('bank'))

                                            AddBank(
                                        name: ServiceProviderList[index]
                                                ['name'] ??'',logo: ServiceProviderList[index] ['logo'] ??'',billProviderID: ServiceProviderList[index]['billProviderID'] ??'',
                                                billCategoryID:widget.categoryID,
                                      )
                                      ,

                                    );

                                    // return GraphScreen(graphData: widget.mp, user: widget.user);
                                  }));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                indent: SizeConfig.widthMultiplier * 3.5,
                                endIndent: SizeConfig.widthMultiplier * 3.5,
                                color: Color(0xff979797),
                                thickness: 0.8,
                              );
                            },
                            itemCount: ServiceProviderList.length),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 3,
                          //  vertical: SizeConfig.heightMultiplier * 2.2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.heightMultiplier * 2)),
                          border: Border.all(color: AppTheme.main, width: 1.0),
                        ),
                        height: SizeConfig.heightMultiplier * 15,
                        child: Center(
                            child: Text(
                                'Sorry, No provider is there in the given category!')),
                      );
              }
              if (state is ErrorServiceProviderListState)
                return Center(child: Text(state.message));
              else
                return Center(
                    child: Text('event not fired or state is incorrect!' +
                        state.runtimeType.toString()));
            }),
          ]),
        ),
      ]),
    );
  }
}
