import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/clip_circle.dart';
import 'package:flux_payments/widgets/draw_dashline.dart';
import 'package:flux_payments/widgets/qr_code.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponDetailScreen extends StatefulWidget {
  const CouponDetailScreen({Key? key}) : super(key: key);

  @override
  _CouponDetailScreenState createState() => _CouponDetailScreenState();
}

class _CouponDetailScreenState extends State<CouponDetailScreen> {
  final Shader linearGradientText = LinearGradient(
    // center: Alignment(-1,-1),
    // radius:2,
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xffB772EE),
      Color(0xff7041EE),
    ],
  ).createShader(
    Rect.fromLTWH(1.0, 20.0, 20.0, 80.0),
  );
  bool isRedeemed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double bottomUp = size.height * 0.005, holeRadius = size.width * 0.15;
    return Scaffold(
      floatingActionButton: backButton(context, "couponDetailsButton",Color(0xffFAD7A1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            backgroundColor: Color(0xffFAD7A1),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //     "assets/images/burger.png",
                      //   ),
                      // ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffFAD7A1), Color(0xffE96D71)],
                      ),
                    ),
                    // child: ,
                  ),
                  Positioned(
                    right: -40,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/burger.png",
                      scale: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ClipPath(
                  clipper: CircleClipper(bottomUp, holeRadius),
                  child: CustomPaint(
                    foregroundPainter:
                        DashLineDrawer(context, bottomUp, holeRadius),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top:
                          Radius.circular(5),
                        ),
                        color: Color(0xffE9E9FF),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      height: MediaQuery.of(context).size.height * 0.27,
                      padding: EdgeInsets.fromLTRB(12,12,12,12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // margin: EdgeInsets.all(15),
                            // padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  2,
                                ),
                              ),
                            ),
                            child: Text(
                              "Valid until 01-Jun-2021",
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  color: AppTheme.main,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Free plant-based whopper",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis cursus enim tempor enim eu, pretium aliquet. Integer morbi volutpat sit porttitor justo malesuada. Aliquam dignissim cursus tincidunt tempus habitasse. Maecenas mollis elementum arcu, etiam a. ",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                            ),
                          ),
                          // Expanded(
                          //   child: Align(
                          //     alignment: Alignment.bottomCenter,
                          //     child: A
                          //   ),
                          // ),

                          // if (isRedeemed)
                          // Center(
                          //   child: AnimatedContainer(
                          //     duration: Duration(milliseconds: 6500),
                          //     curve: Curves.linearToEaseOut,
                          //     // width: 450,
                          //     // height: isRedeemed ? 250 : 10,
                          //     child: isRedeemed
                          //         ? generateQRCode("testing")
                          //         : null,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom:
                      Radius.circular(5),
                    ),
                    color: Color(0xffE9E9FF),
                  ),
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  duration: Duration(milliseconds: 500),
                  height: !isRedeemed
                      ? MediaQuery.of(context).size.height * 0.085
                      : MediaQuery.of(context).size.height * 0.52,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin:EdgeInsets.only(bottom: 16,),
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
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
                                      // color: AppTheme.main,
                                      foreground: Paint()
                                        ..shader = linearGradientText,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isRedeemed = !isRedeemed;
                                    log("11222 $isRedeemed");
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                      
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8,
                                      ),
                                    ),
                                    gradient: RadialGradient(
                                      center: Alignment(0.6, 0.5),
                                      colors: [
                                        Color(0xffB772EE),
                                        Color(0xff7041EE),
                                      ],
                                      radius: 2.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Redeem Now",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        // height: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isRedeemed)
                        //   Center(
                        //     child: 
                        Container(
                                width: size.width * 0.9,
                                height: size.width * 0.9,
                                child: 
                        ExpandedSection(
                          child: generateQRCode(context, "testing"),
                          expand: isRedeemed,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppTheme.main,
                  indent: 16,
                  endIndent: 16,
                ),
                // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Terms & Condition",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 1, 16, 16),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis cursus enim tempor enim eu, pretium aliquet. Integer morbi volutpat sit porttitor justo malesuada. Aliquam dignissim cursus tincidunt tempus habitasse. Maecenas mollis elementum arcu, etiam a. Sed aliquam nunc in lectus. Aliquet eget sapien nisl odio massa aliquet. Et maecenas tellus porta tortor turpis quis a. Bibendum in tempor at arcu eget nec. Convallis lectus tristique nulla volutpat. Varius sagittis, elementum tortor adipiscing hendrerit.Facilisis suspendisse at maecenas tristique dui ultricies placerat. In lectus eu lectus gravida vulputate. Ultrices nisl nibh dis gravida morbi iaculis pellentesque fermentum. Sed convallis non etiam diam mauris sem lacus. Vitae duis eu iaculis dictumst. Pulvinar amet, sed sollicitudin mi. Amet, semper pretium diam ornare mi aliquam, ultrices viverra enim. Risus lacus auctor morbi elementum elementum nullam tincidunt amet. Nec vitae facilisis nisl sit. Metus aliquet velit orci ultricies. At tellus mauris quis enim. Tincidunt a lacus, in id velit, nibh vel congue quis. Aliquam convallis turpis neque elit. Rutrum nisl donec felis tortor, id.Quam diam sit feugiat et in. Dictum condimentum eget lacus aliquet vitae tincidunt duis. Ultrices mattis nunc viverra ultricies sed. At facilisi imperdiet pretium vulputate tincidunt ultrices cursus faucibus amet. Aliquam venenatis tortor vitae vestibulum aliquam elit tellus sed. Pulvinar est condimentum at sem. Condimentum tincidunt leo, ipsum maecenas enim duis. Nisi netus id etiam sed eget condimentum aliquet. Cursus nisl, sed non nulla ac posuere eleifend. At pharetra, volutpat massa hac lobortis. Natoque magna sociis duis duis nec elementum ultrices amet. Fames diam massa tincidunt libero sed ultrices lorem habitant.Ac interdum aliquam amet consectetur vulputate. Ut viverra etiam fringilla massa aliquet vitae sit. Varius orci urna nascetur tortor. Sapien magna interdum at tincidunt ullamcorper. Mattis non tristique orci neque risus. Neque, ac id condimentum arcu suspendisse. Sagitti",
                    style: GoogleFonts.montserrat(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget? child;
  final bool expand;
  ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 20000));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
