import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/widgets/flux_logo.dart';

class DetailedPayment extends StatefulWidget {
  final Map<String, dynamic> paymentData;
  final User user;
  const DetailedPayment(
      {Key? key, required this.paymentData, required this.user})
      : super(key: key);

  @override
  _DetailedPaymentState createState() => _DetailedPaymentState();
}

class _DetailedPaymentState extends State<DetailedPayment> {
  @override
  Widget build(BuildContext context) {
    bool? _isChecked = false;
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
                        "My Cards",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 5,
                  color: Colors.amber,
                  width: SizeConfig.widthMultiplier * 40,
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Detailed Bill",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),

// Container(
//  width: SizeConfig.widthMultiplier*90,
//  height: SizeConfig.heightMultiplier*10,
//   padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*3),
//   //width: SizeConfig.widthMultiplier*80,
//     decoration: BoxDecoration(
//       border: Border.all(color: AppTheme.main,),
//     borderRadius: BorderRadius.all( Radius.circular(SizeConfig.heightMultiplier * 2)),
//     ),
//     child: CheckboxListTile(
//       tileColor:Colors.amber,
//       controlAffinity: ListTileControlAffinity.leading,
//       title: const Text('Woolha.com'),
//       subtitle: const Text('A programming blog'),
//       secondary: const Icon(Icons.web),
//       activeColor: Colors.red,
//       checkColor: Colors.yellow,
//       selected: _isChecked,
//       value: _isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           _isChecked = value;
//         });
//       },
//     ),
//   ),

                buildCheckbox(true),
                // CheckboxListTile(
                //   controlAffinity: ListTileControlAffinity.leading,
                //   value: _isChecked,
                //   onChanged: (bool? value) {
                //     setState(() {
                //       _isChecked = value;
                //     });
                //   },
                // )
                // Container(
                //   padding: EdgeInsets.all(15.0),
                //   child: LineChartGraph(
                //     mp: widget.paymentData,
                //     height: SizeConfig.heightMultiplier * 65,
                //     width: SizeConfig.widthMultiplier * 92,
                //     user: widget.user,
                //     popup: false,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(bool? val) => Checkbox(
      value: val,
      onChanged: (value) {
        setState(() {
          val = value;
        });
      });
}
