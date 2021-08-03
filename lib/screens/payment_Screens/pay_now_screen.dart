import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/screens/payment_Screens/select_payment_method_screen.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/hello_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PayNowScreen extends StatefulWidget {
  final String? userName;
  const PayNowScreen({Key? key, this.userName}) : super(key: key);

  @override
  _PayNowScreenState createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  Set<int> selectedBills = {};
  bool isAllSelected = false;
  ItemScrollController _scrollController = ItemScrollController();
  int length = 20;
  List<Color> cardBgColors = [
    Colors.blue.shade900,
    Colors.blue,
    Colors.redAccent,
    Colors.pink,
    Colors.black,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, "payNowBackButton"),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            fluxLogo(context),
            helloWidget("shourya", context),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "My cards",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.aspectRatio * 370,
              child: ScrollablePositionedList.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  child: CreditCardWidget(
                    cardNumber: "9888098789765",
                    expiryDate: "11/23",
                    cardType: CardType.mastercard,
                    cardHolderName: "monikinderjit sing",
                    cvvCode: "111",
                    showBackView: false,
                    cardBgColor: cardBgColors[index % cardBgColors.length],
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    width: MediaQuery.of(context).size.aspectRatio * 500,
                    animationDuration: Duration(milliseconds: 1000),
                  ),
                ),
                itemScrollController: _scrollController,
                reverse: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Detailed Bill",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,

              //  margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.main,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 43,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: ListTile(
                      minVerticalPadding: 0,
                      minLeadingWidth: 20,
                      horizontalTitleGap: 0,
                      dense: true,
                      leading: Container(
                        child: Checkbox(
                          value: isAllSelected,
                          onChanged: (v) {
                            setState(() {
                              selectedBills = {};
                              if (v == true) {
                                for (int i = 0; i < length; i++) {
                                  selectedBills.add(i);
                                }
                              } else {
                                selectedBills = {};
                              }
                              isAllSelected = v!;
                            });
                          },
                        ),
                      ),
                      title: Text(
                        "Select All",
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Container(child: Text('')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: ListView.builder(
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            width: 362,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: ListTile(
                              horizontalTitleGap: 0,
                              minVerticalPadding: 0,
                              dense: true,
                              minLeadingWidth:
                                  MediaQuery.of(context).size.width * 0.167,
                              leading: Container(
                                width: MediaQuery.of(context).size.width * 0.17,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                      // color: Colors.red,
                                      child: Checkbox(
                                        value: selectedBills.contains(index)
                                            ? true
                                            : false,
                                        onChanged: (v) {
                                          log("$v");
                                          setState(() {
                                            if (selectedBills.contains(index)) {
                                              selectedBills.remove(index);
                                            } else {
                                              selectedBills.add(index);
                                            }
                                            isAllSelected =
                                                (selectedBills.length == length)
                                                    ? true
                                                    : false;
                                          });
                                        },
                                      ),
                                    ),
                                    CircleAvatar(backgroundColor: Colors.blue),
                                    // SizedBox(width: 10,),
                                  ],
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Bill Name",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Due date",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              trailing: Text(
                                "-400",
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Color(0xffE9E9FF),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ListTile(
                            dense: true,
                            minVerticalPadding: 0,
                            // minLeadingWidth: MediaQuery.of(context).size.width*0.01,

                            leading: Text(
                              "TOTAL BILL",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              "-400",
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ListTile(
                            minVerticalPadding: 0,
                            minLeadingWidth:
                                MediaQuery.of(context).size.width * 0.01,
                            dense: true,
                            leading: Image.asset(
                              "assets/images/coin.png",
                            ),
                            title: Text(
                              "Flux Points",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              "-400",
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SelectPaymentScreen(),
                    ),
                  );
                },
                child: gradientButton(context, "Pay Now")),
          ],
        ),
      ),
    );
  }
}
