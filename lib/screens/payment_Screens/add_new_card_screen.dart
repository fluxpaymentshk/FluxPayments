import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_bloc.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_event.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/gradient_button.dart';

class AddCardNewScreen extends StatefulWidget {
  final String? uid;
  const AddCardNewScreen({Key? key, this.uid}) : super(key: key);

  @override
  _AddCardNewScreenState createState() => _AddCardNewScreenState();
}

class _AddCardNewScreenState extends State<AddCardNewScreen> {
  var _newCardFormKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
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
      floatingActionButton: backButton(context, "addNewCardScreen"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: BlocListener<CardsBloc, CardsState>(
        listener: (ctx, state) {
          if (state is ErrorCards) {
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error adding your card"),
              ),
            );
          }
          if (state is UpdatedCards) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Updated Cards"),
              ),
            );
          }
          if (state is UpdatingCards) {
            showDialog(
                context: ctx,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
        },
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.only(left: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                fluxLogo(context),
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  animationDuration: Duration(milliseconds: 2000),
                ),
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,

                  onCreditCardModelChange: (creditCardModel) {
                    log("${creditCardModel.cardNumber}    ${creditCardModel.cardHolderName}  ${creditCardModel.cvvCode}   ${creditCardModel.expiryDate}");
                    setState(() {
                      cardHolderName = creditCardModel.cardHolderName;
                      cvvCode = creditCardModel.cvvCode;
                      expiryDate = creditCardModel.expiryDate;
                      cardNumber = creditCardModel.cardNumber;
                      isCvvFocused = creditCardModel.isCvvFocused;
                      log("${creditCardModel.cardNumber}    ${creditCardModel.cardHolderName}  ${creditCardModel.cvvCode}   ${creditCardModel.expiryDate}");
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
                      cardNumber = cardNumber.replaceAll(" ", "");
                      log("___$cardNumber**");

                      BlocProvider.of<CardsBloc>(context).add(
                        AddCard(
                          userID: widget.uid,
                          expiryDate: expiryDate,
                          cardNumber: cardNumber,
                          cvv: cvvCode,
                          holderName: cardHolderName,
                        ),
                      );
                    }
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
          ),
        ),
      ),
    );
  }
}
