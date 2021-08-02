import 'package:flutter/material.dart';
import 'package:flux_payments/constant.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/screens/card.dart';
import 'package:flux_payments/screens/custom_dialog_box.dart';

class CouponsList extends StatefulWidget {
  final List<myCoupons> coupons;
  const CouponsList(List<myCoupons> this.coupons);

  @override
  _CouponsListState createState() => _CouponsListState();
}

class _CouponsListState extends State<CouponsList> {
  double topContainer = 0;
  ScrollController controller = ScrollController();
  var height;
  var width;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        double value = controller.offset / (height * 0.18 * 0.6);
        topContainer = value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {
      height = size.height;
      width = size.width;
    });
    return Scaffold(
      body: GestureDetector(
        onVerticalDragStart: (details){
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.03, horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Coupon",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, height * 0.03, 0, 0),
                height: height * 0.85,
                //! Change height
                //height: !expand ? height * 0.2 : height * 0.18 * 14 * 0.7 + height * 0.18,
                //height: expand ? height * 0.3 : height,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            controller: controller,
                            //itemCount: widget.coupons.length,
                            itemCount: 1,
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
                                    heightFactor: 0.2,
                                    alignment: Alignment.topCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomDialogBox(
                                                widget.coupons[index],
                                                colors[index % 5],
                                              );
                                            });
                                      },
                                      child: CouponCard(
                                        widget.coupons[index],
                                        colors[index % 5],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
