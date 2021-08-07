import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/screens/payment_Screens/loading_screen.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  final String? transferMethod;
  final String? payerName;
  final String? last4DigitCardNumer;
  final double? amount;
  const ConfirmPaymentScreen(
      {Key? key,
      this.transferMethod,
      this.payerName,
      this.last4DigitCardNumer,
      this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, 'backPaymentConfirm'),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              fluxLogo(context),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  primary: true,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        // SvgPicture.asset('assets/icons/lock_gradient.svg'),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/icons/lock_gradient.png',
                            fit: BoxFit.cover,
                            scale: 0.4,
                          ),
                        ),
                        Text(
                          "Total payment to be confirmed",
                          style: GoogleFonts.montserrat(fontSize: 15),
                        ),
                        Text(
                          "\$ ${amount}",
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              color: AppTheme.main,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Text(
                                  "Transfer Method",
                                  style: GoogleFonts.montserrat(fontSize: 15),
                                ),
                                trailing: Text(
                                  "$transferMethod",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20, color: AppTheme.main),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Card Number(Last 4 digits)",
                                  style: GoogleFonts.montserrat(fontSize: 15),
                                ),
                                trailing: Text(
                                  "$last4DigitCardNumer",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20, color: AppTheme.main),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Payer Name",
                                  style: GoogleFonts.montserrat(fontSize: 15),
                                ),
                                trailing: Text(
                                  "$payerName",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20, color: AppTheme.main),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => LoadingScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                              border: Border.all(color: AppTheme.main),
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
                                "Confirm",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
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
                ),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
