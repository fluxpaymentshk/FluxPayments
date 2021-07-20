import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/src/chart/line_chart/line_chart_data.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';

class LineChartGraph extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartGraphState();
}

class LineChartGraphState extends State<LineChartGraph> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:1.23,
     // child: Container(),
      child: Container(
      //   height: SizeConfig.heightMultiplier * 50,
      // width: SizeConfig.widthMultiplier * 90,
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
              children: <Widget>[
                const SizedBox(
                  height: 37,
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
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      //isShowingMainData ? sampleData1() : sampleData2(),
                      sampleData1(),

                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

             Center(
               child: Row(
                 children: [
                   
                   Container(
                     child:Row(

                      children:[
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xffaa4cfc),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier*2,),
                           Text('HSBC Card'),

                      ],
                     ),
                   ),
                   Spacer(),

                    Container(
                     child:Row(

                      children:[
                        CircleAvatar(
                           radius: 3,
                          backgroundColor: Color(0xffaa4cfc),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier*2,),
                           Text('HSBC Card'),

                      ],
                     ),
                   ),
Spacer(),
                    Container(
                     child:Padding(
                       padding: const EdgeInsets.all(6.0),
                       child: Row(

                        children:[
                          CircleAvatar(
                             radius: 3,
                            backgroundColor: Color(0xffaa4cfc),
                          ),
                          SizedBox(width: SizeConfig.widthMultiplier*2,),
                             Text('HSBC Card'),

                        ],
                       ),
                     ),
                   )
                 
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
     
    );
  }

  LineChartData sampleData1() {
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
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
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
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
          margin: 8,             //Exppppppppppppp
          reservedSize: 30,  //Exppppppppppppppppp
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
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
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