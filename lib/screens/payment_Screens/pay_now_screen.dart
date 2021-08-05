import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/bank_bloc/bank_bloc.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_bloc.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_event.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_state.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_bloc.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_event.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/Cards.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/screens/payment_Screens/detailed_bill.dart';
import 'package:flux_payments/screens/payment_Screens/select_payment_method_screen.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/getCardType.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/hello_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PayNowScreen extends StatefulWidget {
  final String? userName;
  final DatabaseRepository? databaseRepository;
  const PayNowScreen(
      {Key? key, this.userName, @required this.databaseRepository})
      : super(key: key);

  @override
  _PayNowScreenState createState() => _PayNowScreenState();
}

double totalBill = 0;
double totalFluxPointsService = 0;

Set<int> selectedBills = {};

class _PayNowScreenState extends State<PayNowScreen> {
  ItemScrollController _scrollController = ItemScrollController();
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
  List<Cards> cardsList = [];

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    var paymentsBloc = BlocProvider.of<PaymentBloc>(context);
    var cardsBloc = BlocProvider.of<CardsBloc>(context);
    paymentsBloc.add(GetPendingPayments("Flux-Monik"));
    cardsBloc.add(GetCards(userID: "Flux-Monik"));
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, "payNowBackButton"),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
        if (state is PaymentInitialState || state is LoadingPendingPayment) {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is LoadedPendingPayments) {
          double totalSrvBill = 0;
          double totalFluxSrvPoints = 0;
          state.pendingPayments.forEach((element) {
            totalSrvBill += element.amount!;
            totalFluxSrvPoints += element.fluxPoints!;
          });
          return Container(
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
                BlocBuilder<CardsBloc, CardsState>(
                    builder: (context, cardsState) {
                  if (cardsState is CardsInitialState ||
                      cardsState is LoadingCards) {
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (cardsState is LoadedCards) {
                    List<Cards> cards = cardsState.cards!;
                    cardsList = cards;
                    return Container(
                      height: MediaQuery.of(context).size.aspectRatio * 370,
                      child: ScrollablePositionedList.builder(
                        itemCount: cards.length,
                        itemBuilder: (context, index) => Container(
                          child: CreditCardWidget(
                            cardNumber: cards[index].cardNumber!,
                            expiryDate: cards[index].expiryDate!,
                            cardType:  getCardType(cards[index].cardBrand),
                            cardHolderName: cards[index].holderName!,
                            cvvCode: cards[index].cvv.toString(),
                            showBackView: false,
                            cardBgColor:
                                cardBgColors[index % cardBgColors.length],
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                            width:
                                MediaQuery.of(context).size.aspectRatio * 500,
                            animationDuration: Duration(milliseconds: 1000),
                          ),
                        ),
                        itemScrollController: _scrollController,
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }
                  return Center(
                    child: Container(
                      child: Text("Error loading cards"),
                    ),
                  );
                }),
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
                    child: DetailedBill(
                      pendingPayments: state.pendingPayments,
                      totalSrvBill: totalSrvBill,
                      totalFluxPointsService: totalFluxSrvPoints,
                    )),
                InkWell(
                  onTap: () {
                    selectedBills.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Please Choose services to be paid."),
                            ),
                          )
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (_) =>
                                        BanksBloc(widget.databaseRepository!),
                                  ),
                                  BlocProvider.value(
                                    value: cardsBloc,
                                  ),
                                ],
                                child: SelectPaymentScreen(
                                  cards: cardsList,
                                  amount: totalBill,
                                  fluxPoints: totalFluxPointsService,
                                ),
                              ),
                            ),
                          );
                  },
                  child: gradientButton(context, "Pay Now"),
                ),
              ],
            ),
          );
        }
        // if (state is ErrorPayment) {
        return Center(
          child: Container(
            child: Text("error loading"),
          ),
        );
        // }
      }),
    );
  }
}