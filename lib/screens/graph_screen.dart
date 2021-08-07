import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';

class GraphScreen extends StatefulWidget {
  final Map<String, dynamic> graphData;
  final User user;
  const GraphScreen({Key? key, required this.graphData, required this.user})
      : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
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
                            child: fluxLogo(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                FittedBox(
                  child: Container(
                    height: SizeConfig.heightMultiplier * 9,
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
                                   'Hello ${widget.user.firstName}!',
                                    style: AppTheme.display1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                       
                        Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.all(SizeConfig.heightMultiplier * 1.5),
                          child: Container(
                            // height: SizeConfig.heightMultiplier*12,
                            // width: SizeConfig.widthMultiplier*100,

                            child: Image.asset("assets/images/av.png"),
                            //  child:NetworkImage(widget.user.);
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: SizeConfig.heightMultiplier * 0.09,
                // ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Paid With Flux",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: LineChartGraph(
                    mp: widget.graphData,
                    height: SizeConfig.heightMultiplier * 65,
                    width: SizeConfig.widthMultiplier * 92,
                    user: widget.user,
                    popup: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
