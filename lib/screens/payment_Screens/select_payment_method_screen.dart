import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/CreditCard.dart';
import 'package:flux_payments/screens/payment_Screens/confirm_payment_screen.dart';
import 'package:flux_payments/screens/payment_Screens/loading_screen.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/expand_widget.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/hello_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SelectPaymentScreen extends StatefulWidget {
  final double? amount;
  const SelectPaymentScreen({Key? key, this.amount}) : super(key: key);

  @override
  _SelectPaymentScreenState createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  bool mobiletapped = false;
  bool cardTapped = false;
  bool cardSelect = false;
  int? radioValue = -1;
  var _mobileBankFormKey = GlobalKey<FormState>();
  var _newCardFormKey = GlobalKey<FormState>();
  ItemScrollController _scrollController = ItemScrollController();
  var bankAccController = ScrollController();
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
      body:
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   padding: EdgeInsets.all(16),
          //   height: MediaQuery.of(context).size.height,
          // child:
          ListView(
        padding: EdgeInsets.all(16),
        children: [
          fluxLogo(context),
          helloWidget("shourya", context),
          Container(
            height: MediaQuery.of(context).size.aspectRatio * 370,
            child: ScrollablePositionedList.builder(
              itemCount: 500,
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Select Payment Method",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: mobiletapped
                  ? MediaQuery.of(context).size.height * 1.2
                  : cardTapped
                      ? MediaQuery.of(context).size.height * 2
                      : MediaQuery.of(context).size.height * 1.1,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          cardTapped = !cardTapped;
                          mobiletapped = false;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: double.infinity,
                        child: Card(
                          color: cardTapped ? Color(0xffE9E9FF) : Colors.white,
                          elevation: 12,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppTheme.main),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/card.png"),
                                Text(
                                  "  Credit card/Debit Card",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: mobiletapped
                                        ? Colors.grey.shade600
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpandWidget(
                      expand: cardTapped,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffE9E9FF),
                            border: Border(
                                left: BorderSide(color: AppTheme.main),
                                right: BorderSide(color: AppTheme.main),
                                bottom: BorderSide(color: AppTheme.main))),
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: ListView.builder(
                            controller: bankAccController,
                            padding: EdgeInsets.only(bottom: 16),
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              if (i == 19) {
                                return Column(
                                  children: [
                                    Card(
                                      color: Color(0xffE9E9FF),
                                      elevation: 4,
                                      child: ListTile(
                                        title: Text("Account Number"),
                                        trailing: Radio<int>(
                                          activeColor: AppTheme.main,
                                          value: i,
                                          groupValue: radioValue,
                                          // toggleable: true,
                                          onChanged: (v) {
                                            setState(() {
                                              radioValue = v;
                                              log("$radioValue");
                                            });
                                            _scrollController.scrollTo(
                                              index: i,
                                              duration: Duration(
                                                milliseconds: 200,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xffE9E9FF),
                                      elevation: 4,
                                      child: ListTile(
                                        title: Text("Add New Card"),
                                        trailing: Radio<int>(
                                          activeColor: AppTheme.main,
                                          value: i + 1,
                                          groupValue: radioValue,
                                          // toggleable: true,
                                          onChanged: (v) {
                                            setState(() {
                                              radioValue = v;
                                              log("$radioValue");
                                            });
                                            log("${bankAccController.offset}");
                                            bankAccController.jumpTo(
                                                bankAccController.offset + 70);
//                                             bankAccController.animateTo(1073.4571428571428
// ,
//                                                 duration:
//                                                     Duration(milliseconds: 10000),
//                                                 curve: Curves.linear);
                                            // _scrollController.scrollTo(
                                            //   index: i,
                                            //   duration: Duration(
                                            //     milliseconds: 200,
                                            //   ),
                                            // );
                                          },
                                        ),
                                      ),
                                    ),
                                    ExpandWidget(
                                      expand: radioValue == 20 ? true : false,
                                      child: expandNewCardDetails(),
                                    ),
                                  ],
                                );
                              }
                              return Card(
                                color: Color(0xffE9E9FF),
                                elevation: 4,
                                child: ListTile(
                                  title: Text("Account Number"),
                                  trailing: Radio<int>(
                                    activeColor: AppTheme.main,
                                    value: i,
                                    groupValue: radioValue,
                                    // toggleable: true,
                                    onChanged: (v) {
                                      setState(() {
                                        radioValue = v;
                                        log("$radioValue");
                                      });
                                      _scrollController.scrollTo(
                                        index: i,
                                        duration: Duration(
                                          milliseconds: 200,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                      )),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mobiletapped = !mobiletapped;
                        cardTapped = false;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: double.infinity,
                      child: Card(
                        color: mobiletapped ? Color(0xffE9E9FF) : Colors.white,
                        elevation: 12,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppTheme.main),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/mobile.png",
                              ),
                              Text(
                                "  Mobile banking transfer",
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: cardTapped
                                      ? Colors.grey.shade600
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpandWidget(
                    expand: mobiletapped,
                    child: expandBankDetailsChild(),
                  ),
                  InkWell(
                    onTap: () {},
                    child: paymentTile(
                      "assets/icons/alipay.png",
                      "Alipay",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: paymentTile("assets/icons/weChat.png", "WeChat"),
                  ),
                  // InkWell(
                  //   onTap: () async {},
                  //   child: gradientButton(
                  //     context,
                  //     "Proceed",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
      // ),
    );
  }

  Widget paymentTile(String imageAddress, String title) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      child: Card(
        elevation: 12,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppTheme.main),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageAddress),
              Text(
                "  $title",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: mobiletapped || cardTapped
                      ? Colors.grey.shade600
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget expandNewCardDetails() {
    String cardNumber = "";
    String expiryDate = "";
    String cardHolderName = "";
    String cvvCode = "";
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9E9FF),
        // border: Border(
        //   left: BorderSide(
        //       color: AppTheme.main),
        //   right: BorderSide(
        //       color: AppTheme.main),
        //   bottom: BorderSide(
        //       color: AppTheme.main),
        // ),
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.only(left: 8),
      child: Column(
        children: [
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel) {
              log("${creditCardModel.cardHolderName}  ${creditCardModel.cvvCode}   ${creditCardModel.expiryDate}");
              setState(() {
                cardHolderName = creditCardModel.cardHolderName;
                cvvCode = creditCardModel.cvvCode;
                expiryDate = creditCardModel.expiryDate;
                cardNumber = creditCardModel.cardNumber;
              });
            },
            obscureCvv: true,
            // obscureNumber: true,
            cardNumberDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Account Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              labelText: 'Card Holder',
            ),

            themeColor: AppTheme.main,
            formKey: _newCardFormKey,
            cursorColor: AppTheme.main,
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              if (_newCardFormKey.currentState!.validate()) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ConfirmPaymentScreen(
                      transferMethod: "Credit/Debit Card",
                      last4DigitCardNumer: cardNumber.substring(8),
                      payerName: cardHolderName,
                      amount: widget.amount,
                    ),
                  ),
                );
              }
              ;
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(bottom: 8, right: 18),
                child: gradientButton(context, "Proceed"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expandBankDetailsChild() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9E9FF),
        border: Border(
          left: BorderSide(color: AppTheme.main),
          right: BorderSide(color: AppTheme.main),
          bottom: BorderSide(color: AppTheme.main),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.only(left: 8),
      child: Form(
        key: _mobileBankFormKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bank Code",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      // fontWeight: FontWeight.w600,
                      color: AppTheme.main,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  // margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (s) {
                      if (s == null || s.length == 0) {
                        return "Please enter some value";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account Number",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      // fontWeight: FontWeight.w600,
                      color: AppTheme.main,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (s) {
                      if (s == null || s.length == 0) {
                        return "Please enter some value";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account Name",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      // fontWeight: FontWeight.w600,
                      color: AppTheme.main,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (s) {
                      if (s == null || s.length == 0) {
                        return "Please enter some value";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      if (_mobileBankFormKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => LoadingScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 8, right: 18),
                      child: gradientButton(context, "Proceed"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
