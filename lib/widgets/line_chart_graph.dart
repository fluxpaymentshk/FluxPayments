import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/src/chart/line_chart/line_chart_data.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart'
    as point;
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/graph_screen.dart';

class LineChartGraph extends StatefulWidget {
  final Map<String, dynamic> mp;
  final double height, width;
  final bool popup;
  final User user;
  // final int order;
  @override
  const LineChartGraph({
    Key? key,
    required this.mp,
    required this.height,
    required this.popup,
    required this.width,
    required this.user,
    //required this.order
  }) : super(key: key);
  //mp=
  State<StatefulWidget> createState() => LineChartGraphState();
}

class LineChartGraphState extends State<LineChartGraph> {
  bool _weekly = false, _monthly = true, _yearly = false;
  String currDate = "";
  // @override
  //  LineChartGraphState({Key? key, required this.mp}) ;
  //  Map<String, Map<String, do
  //uble>> mp={};

  late bool isShowingMainData;
  Map<String, Map<String, double>> organizedData = {};
  double maximum = 0, minimum = -1;
  // List<String> xaxis = ['2021-09', '2021-08', '2021-07'];
  // List<String> names = ['ICICI', 'HDFC', 'PNB'];

  List<String> xaxis = [];
  List<String> names = [];
  List<Color> color = [
    Color(0xff27b6fc),
    Color(0xffaa4cfc),
    Color(0xff4af699),
  ];
  //final Map<String, Map<String, double>> mp;
  @override
  void initState() {
    //  order = widget.order;

    List<dynamic> temp =
        represent(result: widget.mp, xaxis: xaxis, names: names);
    organizedData = temp[2];
    xaxis = temp[0];
    names = temp[1];

//    print(xaxis);
    print(temp);
    print('bbbbbbbbbbbbbbbbbbbbbbbb');

    super.initState();
    isShowingMainData = true;
  }

  DateTime getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

    setState(() {
      currDate = formattedDate.toString();
    });
    return dateParse;
  }

  String getRightFormat(DateTime dateParse) {
    return "${dateParse.year}-${(dateParse.month).toString().length == 1 ? "0${dateParse.month}" : dateParse.month}-${(dateParse.day).toString().length == 1 ? "0${dateParse.day}" : dateParse.day}";
  }

  List<dynamic> represent(
      {required Map<String, dynamic> result,
      required List<String> xaxis,
      required List<String> names}) {
    List<String> xaxiss = [], namess = [];
    List<dynamic> ans = [];

    var dateParse = getCurrentDate();

    result.keys.forEach((element) {
      if (namess.length != 3) namess.add(element);
    });

    Map<String, Map<String, double>> mp = {};
    print('***********************************');
    print(_monthly);
    if (_monthly) {
      if (dateParse.month == 1) {
        xaxiss.add("${dateParse.year - 1}-${11}");
        xaxiss.add("${dateParse.year - 1}-${12}");
        xaxiss.add("${dateParse.year}-${01}");
      } else if (dateParse.month == 2) {
        xaxiss.add("${dateParse.year - 1}-${12}");
        xaxiss.add("${dateParse.year}-${01}");
        xaxiss.add("${dateParse.year}-${02}");
      } else {
        xaxiss.add(
            "${dateParse.year}-${(dateParse.month - 2).toString().length == 1 ? "0${dateParse.month - 2}" : dateParse.month - 2}");
        xaxiss.add(
            "${dateParse.year}-${(dateParse.month - 1).toString().length == 1 ? "0${dateParse.month - 1}" : dateParse.month - 1}");

        xaxiss.add(
            "${dateParse.year}-${(dateParse.month).toString().length == 1 ? "0${dateParse.month}" : dateParse.month}");
      }
      // setState(() {
      //   xaxis = xaxiss;
      //   names = namess;
      // });
      ans.add(xaxiss);
      ans.add(namess);
      xaxis = xaxiss;
      names = namess;

      print(xaxis);
      print("egegegegeg");

      result.forEach((key, value) {
        //  mp.putIfAbsent(key, () => []);
        if (value.length >= 1 &&
            (value[0]["paidOn"].contains(xaxis[2]) ||
                value[0]["paidOn"].contains(xaxis[1]) ||
                value[0]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 3),
              () => {});

          mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 3)]!
              .putIfAbsent(key, () => 0);

          mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 3)]![
              key] = mp[value[0]["paidOn"]
                  .substring(0, value[0]["paidOn"].length - 3)]![key]! +
              value[0]["rewardPoints"];
        }
        //  mp[key]?.add({value[0]["paidOn"]: value[0]["rewardPoints"]});

        // if (value.length >= 2)
        //   mp[key]?.add({value[1]["paidOn"]: value[1]["rewardPoints"]});

        if (value.length >= 2 &&
            (value[1]["paidOn"].contains(xaxis[2]) ||
                value[1]["paidOn"].contains(xaxis[1]) ||
                value[1]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 3),
              () => {});

          mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 3)]!
              .putIfAbsent(key, () => 0);

          mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 3)]![
              key] = mp[value[1]["paidOn"]
                  .substring(0, value[1]["paidOn"].length - 3)]![key]! +
              value[1]["rewardPoints"];
        }

        if (value.length >= 3 &&
            (value[2]["paidOn"].contains(xaxis[2]) ||
                value[2]["paidOn"].contains(xaxis[1]) ||
                value[2]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 3),
              () => {});

          mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 3)]!
              .putIfAbsent(key, () => 0);

          mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 3)]![
              key] = mp[value[2]["paidOn"]
                  .substring(0, value[2]["paidOn"].length - 3)]![key]! +
              value[2]["rewardPoints"];
        }

        // if (value.length >= 3)
        //   mp[key]?.add({value[2]["paidOn"]: value[2]["rewardPoints"]});

//to process cummulative data for respective month.
        // value.forEach((el) {});
      });

      ans.add(mp);
    }
    if (_yearly) {
      // if(dateParse.month==1)
      //    {
      xaxiss.add("${dateParse.year - 2}");
      xaxiss.add("${dateParse.year - 1}");
      xaxiss.add("${dateParse.year}");

      //  }
      // xaxis = xaxiss;
      xaxis = xaxiss;
      names = namess;
      print(xaxis);
      print("egegegegegyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      result.forEach((key, value) {
        //  mp.putIfAbsent(key, () => []);
        if (value.length >= 1 &&
            (value[0]["paidOn"].contains(xaxis[2]) ||
                value[0]["paidOn"].contains(xaxis[1]) ||
                value[0]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6),
              () => {});

          mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6)]!
              .putIfAbsent(key, () => 0);

          mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6)]![
              key] = mp[value[0]["paidOn"]
                  .substring(0, value[0]["paidOn"].length - 6)]![key]! +
              value[0]["rewardPoints"];
        }
        //  mp[key]?.add({value[0]["paidOn"]: value[0]["rewardPoints"]});

        // if (value.length >= 2)
        //   mp[key]?.add({value[1]["paidOn"]: value[1]["rewardPoints"]});

        if (value.length >= 2 &&
            (value[1]["paidOn"].contains(xaxis[2]) ||
                value[1]["paidOn"].contains(xaxis[1]) ||
                value[1]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6),
              () => {});

          mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6)]!
              .putIfAbsent(key, () => 0);

          mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6)]![
              key] = mp[value[1]["paidOn"]
                  .substring(0, value[1]["paidOn"].length - 6)]![key]! +
              value[1]["rewardPoints"];
        }

        if (value.length >= 3 &&
            (value[2]["paidOn"].contains(xaxis[2]) ||
                value[2]["paidOn"].contains(xaxis[1]) ||
                value[2]["paidOn"].contains(xaxis[0]))) {
          mp.putIfAbsent(
              value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6),
              () => {});

          mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6)]!
              .putIfAbsent(key, () => 0);

          mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6)]![
              key] = mp[value[2]["paidOn"]
                  .substring(0, value[2]["paidOn"].length - 6)]![key]! +
              value[2]["rewardPoints"];
        }

        // if (value.length >= 3)
        //   mp[key]?.add({value[2]["paidOn"]: value[2]["rewardPoints"]});

//to process cummulative data for respective month.
        // value.forEach((el) {});
      });
      // setState(() {
      //   xaxis = xaxiss;
      //   names = namess;
      //   print(
      //       "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkkkkkkkkkkkkkkkkk");
      // });
      ans.add(xaxiss);
      ans.add(names);
      ans.add(mp);
      print(mp);
    }

    if (_weekly) {
      DateTime today = DateTime.now();
      DateTime oneWeekAgo = today.subtract(const Duration(days: 7));
      DateTime twoWeekAgo = today.subtract(const Duration(days: 14));
      DateTime threeWeekAgo = today.subtract(const Duration(days: 21));

      var dateParse = DateTime.parse(today.toString());

      var todayDate = getRightFormat(dateParse);

      dateParse = DateTime.parse(oneWeekAgo.toString());
      var oneWeekAgoDate = getRightFormat(dateParse);

      dateParse = DateTime.parse(twoWeekAgo.toString());
      var twoWeekAgoDate = getRightFormat(dateParse);

      // dateParse = DateTime.parse(threeWeekAgo.toString());
      // var threeWeekAgoDate = getRightFormat(dateParse);

      //xaxiss.add(threeWeekAgoDate);
      xaxiss.add(twoWeekAgoDate);
      xaxiss.add(oneWeekAgoDate);
      xaxiss.add(todayDate);

      result.forEach((key, value) {
        //  mp.putIfAbsent(key, () => []);

        if (value.length >= 1) {
          xaxiss.forEach((el) {
            var end = DateTime.parse(el);
            var start = DateTime.parse(value[0]["paidOn"]);
            //Duration difference = end.difference(start);
            if (end.difference(start).inDays <= 7) {
              mp.putIfAbsent(todayDate, () => {});
              mp[todayDate]!.putIfAbsent(key, () => 0);
              mp[todayDate]![key] =
                  mp[todayDate]![key]! + value[0]["rewardPoints"];
            }
          });

          //   var end = DateTime.parse(todayDate);
        }
        if (value.length >= 2) {
          xaxiss.forEach((el) {
            var end = DateTime.parse(el);
            var start = DateTime.parse(value[0]["paidOn"]);
            //Duration difference = end.difference(start);
            if (end.difference(start).inDays <= 7) {
              mp.putIfAbsent(todayDate, () => {});
              mp[todayDate]!.putIfAbsent(key, () => 0);
              mp[todayDate]![key] =
                  mp[todayDate]![key]! + value[0]["rewardPoints"];
            }
          });

          //   var end = DateTime.parse(todayDate);
        }
        if (value.length >= 3) {
          xaxiss.forEach((el) {
            var end = DateTime.parse(el);
            var start = DateTime.parse(value[0]["paidOn"]);
            //Duration difference = end.difference(start);
            if (end.difference(start).inDays <= 7) {
              mp.putIfAbsent(todayDate, () => {});
              mp[todayDate]!.putIfAbsent(key, () => 0);
              mp[todayDate]![key] =
                  mp[todayDate]![key]! + value[0]["rewardPoints"];
            }
          });

          //   var end = DateTime.parse(todayDate);
        }

        //###############################
        // if (value.length >= 1 &&
        //     (value[0]["paidOn"].compare(xaxis[2]) ||
        //         value[0]["paidOn"].contains(xaxis[1]) ||
        //         value[0]["paidOn"].contains(xaxis[0]))) {
        //   mp.putIfAbsent(
        //       value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6),
        //       () => {});

        //   mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6)]!
        //       .putIfAbsent(key, () => 0);

        //   mp[value[0]["paidOn"].substring(0, value[0]["paidOn"].length - 6)]![
        //       key] = mp[value[0]["paidOn"]
        //           .substring(0, value[0]["paidOn"].length - 6)]![key]! +
        //       value[0]["rewardPoints"];
        // }
        // //  mp[key]?.add({value[0]["paidOn"]: value[0]["rewardPoints"]});

        // // if (value.length >= 2)
        // //   mp[key]?.add({value[1]["paidOn"]: value[1]["rewardPoints"]});

        // if (value.length >= 2 &&
        //     (value[1]["paidOn"].contains(xaxis[2]) ||
        //         value[1]["paidOn"].contains(xaxis[1]) ||
        //         value[1]["paidOn"].contains(xaxis[0]))) {
        //   mp.putIfAbsent(
        //       value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6),
        //       () => {});

        //   mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6)]!
        //       .putIfAbsent(key, () => 0);

        //   mp[value[1]["paidOn"].substring(0, value[1]["paidOn"].length - 6)]![
        //       key] = mp[value[1]["paidOn"]
        //           .substring(0, value[1]["paidOn"].length - 6)]![key]! +
        //       value[1]["rewardPoints"];
        // }

        // if (value.length >= 3 &&
        //     (value[2]["paidOn"].contains(xaxis[2]) ||
        //         value[2]["paidOn"].contains(xaxis[1]) ||
        //         value[2]["paidOn"].contains(xaxis[0]))) {
        //   mp.putIfAbsent(
        //       value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6),
        //       () => {});

        //   mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6)]!
        //       .putIfAbsent(key, () => 0);

        //   mp[value[2]["paidOn"].substring(0, value[2]["paidOn"].length - 6)]![
        //       key] = mp[value[2]["paidOn"]
        //           .substring(0, value[2]["paidOn"].length - 6)]![key]! +
        //       value[2]["rewardPoints"];
        // }

        // if (value.length >= 3)
        //   mp[key]?.add({value[2]["paidOn"]: value[2]["rewardPoints"]});

//to process cummulative data for respective month.
        // value.forEach((el) {});
      });

      // setState(() {
      //   xaxis = xaxiss;
      //   names = namess;
      // });
      ans.add(xaxiss);
      ans.add(namess);
      ans.add(mp);
      xaxis = xaxiss;
      names = namess;

      print(xaxis);
      print("ewkwkwkwkwkwkwklyyyyyyyyyyyyyy");
    }
    print("*********************************************************");

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AspectRatio(
        aspectRatio: widget.width / widget.height,
        // child: Container(),
        child: Container(
          height: SizeConfig.heightMultiplier * 70,
          //  width: SizeConfig.widthMultiplier * 84,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xff2c274c),
            //     Color(0xff46426c),
            //   ],
            color: AppTheme.offWhite,
            // begin: Alignment.bottomCenter,
            // end: Alignment.topCenter,
            // ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //   mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  !widget.popup
                      ? Container(
                          height: SizeConfig.heightMultiplier * 3.6,
                          child: Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4.5,
                                  primary: _weekly
                                      ? AppTheme.main
                                      : AppTheme.offWhite,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.widthMultiplier * 0.36),
                                  side: BorderSide(
                                    width: 1.5,
                                    color: AppTheme.main,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  // textStyle: TextStyle(
                                  //     fontSize: 15,
                                  //     color: _pressed?AppTheme.white:AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                                onPressed: () {
                                  setState(() {
                                    _weekly = true;
                                    _monthly = false;
                                    _yearly = false;
                                    List<dynamic> temp = represent(
                                        result: widget.mp,
                                        xaxis: xaxis,
                                        names: names);

                                    print('wekkkkkkkkkkkkkkkkkkkkkkkkkkkk');
                                    print(temp);
                                    organizedData = temp[2];
                                    xaxis = temp[0];
                                    names = temp[1];
                                    // widget.order = 1;
                                  });
                                },
                                child: Text('Weekly',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _weekly
                                            ? AppTheme.white
                                            : AppTheme.main,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4.5,
                                  primary: _monthly
                                      ? AppTheme.main
                                      : AppTheme.offWhite,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.widthMultiplier * 0.36),
                                  side: BorderSide(
                                    width: 1.5,
                                    color: AppTheme.main,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  // textStyle: TextStyle(
                                  //     fontSize: 15,
                                  //     color: _pressed?AppTheme.white:AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                                onPressed: () {
                                  setState(() {
                                    _monthly = true;
                                    _yearly = false;
                                    _weekly = false;
                                    List<dynamic> temp = represent(
                                        result: widget.mp,
                                        xaxis: xaxis,
                                        names: names);

                                    print('monthlyyyyyyyyyyyyyyyy');
                                    print(temp);
                                    organizedData = temp[2];
                                    xaxis = temp[0];
                                    names = temp[1];
                                  });
                                },
                                child: Text('Monthly',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _monthly
                                            ? AppTheme.white
                                            : AppTheme.main,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4.5,
                                  primary: _yearly
                                      ? AppTheme.main
                                      : AppTheme.offWhite,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.widthMultiplier * 0.36),
                                  side: BorderSide(
                                    width: 1.5,
                                    color: AppTheme.main,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  // textStyle: TextStyle(
                                  //     fontSize: 15,
                                  //     color: _pressed?AppTheme.white:AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                                onPressed: () {
                                  setState(() {
                                    _yearly = true;
                                    _monthly = false;
                                    _weekly = false;
                                    List<dynamic> temp = represent(
                                        result: widget.mp,
                                        xaxis: xaxis,
                                        names: names);

                                    print('yearlyyyyyyyyyyyyyyyyyyyy');
                                    print(temp);
                                    organizedData = temp[2];
                                    xaxis = temp[0];
                                    names = temp[1];
                                  });
                                },
                                child: Text('Yearly',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: _yearly
                                            ? AppTheme.white
                                            : AppTheme.main,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  // const Text(
                  //   'Unfold Shop 2018',
                  //   style: TextStyle(
                  //     color: Color(0xff827daa),
                  //     fontSize: 16,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // const Text(
                  //   'Monthly Sales',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 32,
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 2),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(
                  //   height: 37,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 6.0),
                      child: LineChart(
                        //isShowingMainData ? sampleData1() : sampleData2(),
                        sampleData1(),

                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: color[0],
                              ),
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 2,
                              ),
                              Text(names[0]),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: color[1],
                              ),
                              SizedBox(
                                width: SizeConfig.widthMultiplier * 2,
                              ),
                              Text(names[1]),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: color[2],
                                ),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                Text(names[2]),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.refresh,
              //     color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
              //   ),
              //   onPressed: () {
              //     setState(() {
              //       isShowingMainData = !isShowingMainData;
              //     });
              //   },
              // )
            ],
          ),
        ),
      ),
      onDoubleTap: () {
        if (widget.popup) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return GraphScreen(graphData: widget.mp, user: widget.user);
          }));
        }
      },
    );
  }

  LineChartData sampleData1() {
    print("hyyyyyyyyyyyyyyyyyyyyyyyyy");
    print(xaxis);
    organizedData.forEach((key, value) {
      organizedData[key]!.forEach((key, value) {
        maximum = max(maximum, value);
        if (minimum == -1) minimum = value;
        minimum = min(minimum, value);
      });
    });
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.2),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22, // Expppppppppppppppp
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            //   fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          margin: 10, // EXppppppppppppppppppppppp
          getTitles: (value) {
            // organizedData.forEach((key, value) {
            //   xaxis.add(key);
            // });
            switch (value.toInt()) {
              case 2:
                return xaxis[0];
              case 7:
                return xaxis[1];
              case 12:
                return xaxis[2];
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            //   fontWeight: FontWeight.bold,
            fontSize: 10,
            // wordSpacing: 0.0,
          ),

          interval: (minimum == 0) ? maximum / minimum : maximum / 10,
          // margin: 10,
//           getTitles: (value) {
//             // List<String> yaxis = [];
//             organizedData.forEach((key, value) {
//               organizedData[key]!.forEach((key, value) {
//                 maximum = max(maximum, value);
//                 if (minimum == -1) minimum = value;
//                 minimum = min(minimum, value);
//               });
//             });
//             print(maximum);
//             print('___________________');
//             print(minimum);

//             print((maximum).toString());
//             print((minimum + 2 * (maximum - minimum) / 3).toInt().toString());
//             print((minimum + (maximum - minimum) / 3).toInt().toString());
//             print(minimum.toString());
//             // maximum = 1500;
//             // minimum = 1000;
//             // if (value.toInt() == maximum.toInt()) {
//             //   print("fifty");
//             //   return (maximum).toString();
//             // }

//             //   if (value.toInt() ==
//             //     ( (minimum + 2 * (maximum - minimum) / 3).toInt())   ) {
//             //   print("fiftyy");
//             //   return (((minimum + 2 * (maximum - minimum) / 3).toInt()).toString());
//             // }

//             //   if (value.toInt() ==
//             //     ((minimum + (maximum - minimum) / 3).toInt()) ) {
//             //   print("fiftyyy");
//             //   return (minimum + (maximum - minimum) / 3).toInt().toString();
//             // }

//             //  if (value.toInt() == minimum.toInt()) {
//             //  print("fiftyyyy");
//             //   return minimum.toString();
//             // }
//             // switch (value.toInt()) {
//             //   case 4:
//             //     return (maximum).toString();
//             //   case 3:
//             //     return (minimum + 2 * (maximum - minimum) / 3).toInt().toString();
//             //   case  (minimum + (maximum -minimum) / 3).toInt():
//             //     return (minimum + (maximum -minimum) / 3).toInt().toString();
//             //   case minimum:
//             //     return minimum.toString();
//             // }
//             // switch (value.toInt()) {
//             //   case 40:
//             //     return '40';
//             //   case 30:
//             //     return '30';
//             //   case 20:
//             //     return '20';
//             //   case 10:
//             //     return '10';
//             //   case 0:
//             //     return '0';
//             // }
//             // switch (value.toInt()) {
//             //   case 4:
//             //     return '4m';
//             //   case 3:
//             //     return '3m';
//             //   case 2:
//             //     return '2m';
//             //   case 1:
//             //     return '1m';
//             // }

// if(minimum==0 && (value.toInt() % ((maximum - minimum) ~/ (10)) == 0))
// {
//               return value.toString();
// }
//             if (value.toInt() % ((maximum - minimum) ~/ (minimum*2)) == 0)
//               return value.toString();
//             return '';
//           },

          margin: 8, //Exppppppppppppp
          reservedSize: 30, //Exppppppppppppppppp
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 1, //For last line in x axis
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      //  minY: 0,
      //maxY: maximum,
      //maxY: 50,
      maxX: 14,
      minX: 0,
      // minX: 0,
      // maxX: 14,
      // maxY: 4,
      // minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    List<LineChartBarData> lineChartBarData = [];
    //  organizedData.forEach((key, value) {
    //             xaxis.add(key);
    //           });
    //  int k = 1;

    List<point.FlSpot>? spotss = [];
    // int j = 0;
    for (int j = 0; j < names.length; j++) {
      int k = 2;
      for (int i = 0; i < xaxis.length; i++) {
        spotss!.add(FlSpot(
            (i + (k)).toDouble(),
            (organizedData[xaxis[i]] == null)
                ? 0
                : organizedData[xaxis[i]]![names[j]] ?? 0));
        k += 5;
      }
      print(spotss);
      print("ZZZZZZZZZZZZZZZ");
      lineChartBarData.add(
        LineChartBarData(
          spots: spotss,
          isCurved: true,
          colors: [color[j]],
          barWidth: 3,
          isStrokeCapRound: true,
          curveSmoothness: 0.35,
          preventCurveOverShooting: true,
          preventCurveOvershootingThreshold: 4.0,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      );
      spotss = [];
    }

    ////////////////////////////////////

    // for (int i = 0; i < xaxis.length; i++) {
    //   List<point.FlSpot>? spotss = [];
    //   spotss.add(FlSpot(
    //       (i).toDouble(),
    //       (organizedData[xaxis[i]] == null)
    //           ? 0
    //           : organizedData[xaxis[i]]!['ICICI'] ?? 0));
    //   spotss.add(FlSpot(
    //       (i).toDouble(),
    //       (organizedData[xaxis[i]] == null)
    //           ? 0
    //           : organizedData[xaxis[i]]!['HDFC'] ?? 0));

    //   spotss.add(FlSpot(
    //       i.toDouble(),
    //       (organizedData[xaxis[i]] == null)
    //           ? 0
    //           : organizedData[xaxis[i]]!['PNB'] ?? 0));
    //   print(xaxis);
    //   //print(organizedData[xaxis[i]]);
    //   print(spotss);
    //   print('#############');
    //   lineChartBarData.add(
    //     LineChartBarData(
    //       spots: spotss,
    //       isCurved: true,
    //       colors: [color[i]],
    //       barWidth: 3,
    //       isStrokeCapRound: true,
    //       dotData: FlDotData(
    //         show: false,
    //       ),
    //       belowBarData: BarAreaData(
    //         show: false,
    //       ),
    //     ),
    //   );
    // }
    // final lineChartBarData1 = LineChartBarData(
    //   spots: [
    //     // FlSpot(1, 1),
    //     // FlSpot(3, 1.5),
    //     // FlSpot(5, 1.4),
    //      FlSpot(2, 20),
    //     FlSpot(7, 0),
    //     FlSpot(12, 0),
    //     // FlSpot(7, 3.4),
    //     // FlSpot(10, 2),
    //     // FlSpot(12, 2.2),
    //     // FlSpot(13, 1.8),
    //   ],
    //   isCurved: true,
    //   colors: [color[0]],
    //   barWidth: 3,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   belowBarData: BarAreaData(
    //     show: false,
    //   ),
    // );
    // final lineChartBarData2 = LineChartBarData(
    //   spots: [
    //     FlSpot(1, 1),
    //     FlSpot(3, 2.8),
    //     FlSpot(7, 1.2),
    //     FlSpot(10, 2.8),
    //     FlSpot(12, 2.6),
    //     FlSpot(13, 3.9),
    //   ],
    //   isCurved: true,
    //   colors: [
    //     color[1],
    //   ],
    //   barWidth: 3,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   belowBarData: BarAreaData(
    //     show: false,
    //     // colors: [
    //     //   const Color(0x00aa4cfc),
    //     // ]
    //   ),
    // );
    // final lineChartBarData3 = LineChartBarData(
    //   spots: [
    //     FlSpot(1, 2.8),
    //     FlSpot(3, 1.9),
    //     FlSpot(6, 3),
    //     FlSpot(10, 1.3),
    //     FlSpot(13, 2.5),
    //   ],
    //   isCurved: true,
    //   colors: [
    //     color[2],
    //   ],
    //   barWidth: 3,
    //   isStrokeCapRound: true,
    //   dotData: FlDotData(
    //     show: false,
    //   ),
    //   belowBarData: BarAreaData(
    //     show: false,
    //   ),
    // );

    // return [
    //   lineChartBarData1,
    //   lineChartBarData2,
    //   lineChartBarData3,
    // ];
    return lineChartBarData;
  }

  // LineChartData sampleData2() {
  //   return LineChartData(
  //     lineTouchData: LineTouchData(
  //       enabled: false,
  //     ),
  //     gridData: FlGridData(
  //       show: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,  //Expppppppp
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff72719b),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 16,
  //         ),
  //         margin: 10,  //Exppppppppp
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 2:
  //               return 'SEPT';
  //             case 7:
  //               return 'OCT';
  //             case 12:
  //               return 'DEC';
  //           }
  //           return '';
  //         },
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff75729e),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 14,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return '1m';
  //             case 2:
  //               return '2m';
  //             case 3:
  //               return '3m';
  //             case 4:
  //               return '5m';
  //             case 5:
  //               return '6m';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       reservedSize: 30,
  //        //Exppppppppp
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true,
  //         border: const Border(
  //           bottom: BorderSide(
  //             color: Color(0xff4e4965),
  //             width: 4,
  //           ),
  //           left: BorderSide(
  //             color: Colors.transparent,
  //           ),
  //           right: BorderSide(
  //             color: Colors.transparent,
  //           ),
  //           top: BorderSide(
  //             color: Colors.transparent,
  //           ),
  //         )),
  //     minX: 0,
  //     maxX: 14,
  //     maxY: 6,
  //     minY: 0,
  //     lineBarsData: linesBarData2(),
  //   );
  // }

  List<LineChartBarData> linesBarData2() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x444af699),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: const [
          Color(0x99aa4cfc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          const Color(0x33aa4cfc),
        ]),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}
