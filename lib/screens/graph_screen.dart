import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/widgets/line_chart_graph.dart';

class GraphScreen extends StatefulWidget {
  final Map<String, dynamic> graphData;
  final User user;
  const GraphScreen({Key? key, required this.graphData,required this.user}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.4,
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

                    Container(
                      height: SizeConfig.heightMultiplier * 12,
                      width: SizeConfig.widthMultiplier * 97,
                      //  decoration: BoxDecoration(color: AppTheme.main),
                      child: Row(
                        children: [
                          Text(
                            'Hello ${widget.user.firstName}!',
                            style: AppTheme.display1,
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(SizeConfig.heightMultiplier*2.0),
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
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                      height: SizeConfig.heightMultiplier * 80,
                      width: SizeConfig.widthMultiplier * 90, user: widget.user,popup:false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
