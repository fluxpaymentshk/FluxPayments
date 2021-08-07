import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/screens/payment_Screens/pay_now_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pay_now_screen.dart';

class DetailedBill extends StatefulWidget {
  final List<UserServicePayments>? pendingPayments;
  final double? totalSrvBill;
  final double? totalFluxPointsService;
  const DetailedBill(
      {Key? key,
      this.pendingPayments,
      this.totalSrvBill,
      this.totalFluxPointsService})
      : super(key: key);

  @override
  _DetailedBillState createState() => _DetailedBillState();
}

class _DetailedBillState extends State<DetailedBill> {
  bool isAllSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      for (int i = 0; i < widget.pendingPayments!.length; i++) {
                        selectedBills.add(i);
                      }
                      totalBill = widget.totalSrvBill!;
                      totalFluxPointsService = widget.totalFluxPointsService!;
                    } else {
                      selectedBills = {};
                      totalBill = 0;
                      totalFluxPointsService = 0;
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
            itemCount: widget.pendingPayments!.length,
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
                  minLeadingWidth: MediaQuery.of(context).size.width * 0.16,
                  leading: Container(
                    width: MediaQuery.of(context).size.width * 0.188,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          // color: Colors.red,
                          child: Checkbox(
                            value: selectedBills.contains(index) ? true : false,
                            onChanged: (v) {
                              log("$v");
                              setState(() {
                                if (selectedBills.contains(index)) {
                                  selectedBills.remove(index);
                                  totalBill -=
                                      widget.pendingPayments![index].amount!;
                                  totalFluxPointsService -= widget
                                      .pendingPayments![index].fluxPoints!;
                                } else {
                                  selectedBills.add(index);
                                  totalBill +=
                                      widget.pendingPayments![index].amount!;
                                  totalFluxPointsService += widget
                                      .pendingPayments![index].fluxPoints!;
                                }
                                isAllSelected = (selectedBills.length ==
                                        widget.pendingPayments!.length)
                                    ? true
                                    : false;
                              });
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              widget.pendingPayments![index].billProviderLogo!),
                          minRadius: MediaQuery.of(context).size.width * 0.05,
                        ),
                        // SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier*2),
                    child: Text(
                      "${widget.pendingPayments![index].billProviderName}",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier*2),
                    child: Text(
                      "${widget.pendingPayments![index].dueDate}",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  trailing: Text(
                    "-${widget.pendingPayments![index].amount}",
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
        )),
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
                    "-$totalBill",
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
                  minLeadingWidth: MediaQuery.of(context).size.width * 0.01,
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
                    "+$totalFluxPointsService",
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
    );
  }
}
