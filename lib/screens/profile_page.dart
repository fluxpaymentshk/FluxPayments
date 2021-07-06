import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/bill_bloc/bill_bloc.dart';
import 'package:flux_payments/models/Bank.dart';
import 'package:flux_payments/models/CreditCard.dart';
import 'package:flux_payments/models/DebitCard.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/user_model.dart';
import 'package:flux_payments/screens/pay_bills.dart';
import 'package:flux_payments/services/user_details_services.dart';
import 'package:awesome_card/awesome_card.dart' as ac;

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // UserDetailsServices().getUserCredentials(user);
  }

  User user = User(firstName: '', uniqueID: '', hasCreditCard: [CreditCard()], refreeID: '');
  CreditCard creditCard = CreditCard();
  DebitCard debitCard = DebitCard();
  Bank bank = Bank();
  UserWallet userWallet = UserWallet();

  @override
  Widget build(BuildContext context) {
    print(user.hasCreditCard.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Material(
            shape: CircleBorder(),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Amplify.Auth.signOut();
          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        },
        child: Icon(Icons.logout),
      ),
      body: FutureBuilder(
          future: UserDetailsServices().getUserCredentials(), //to change
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name : ' +
                            (user.firstName ?? 'firstName') +
                            ' ' +
                            (user.lastName ?? 'lastName'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     'userName : \n' + (user.username ?? 'username'),
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email : \n' + (user.email ?? 'email'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DOB : \n' + (user.dateOfBirth.toString() ?? 'N/A'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Flux Points : \n' + (user.fluxPoints ?? 0).toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mobile number : \n' +
                            (user.mobileNumber ?? '123456789'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'uniqueID : \n' + (user.uniqueID ?? 'xxxx-xxx-xxx'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<BillsBloc>(
                                create: (context) => BillsBloc(),
                                child: Center(), //dummy
                                // PayBills(),
                                // child: context=>PayBills(),
                              ),

                              //(BuildContext context) => const PayBills(),
                            ),
                          );
                        },
                        child: Text(
                          'My Bills',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Text("Payment Options"),
                    //if (user.hasCreditCard != null)
                      ac.CreditCard(
                          cardNumber: creditCard.creditCardNumber != null ? creditCard.creditCardNumber.toString() : "5450 7879 4864 7854",
                          cardExpiry: creditCard.expiryDate.toString() ?? "10/25",
                          cardHolderName: creditCard.name ?? "Card Holder",
                          cvv: creditCard.cvv != null ? creditCard.cvv.toString() : "456",
                          bankName: creditCard.bankName ?? "Axis Bank",
                          cardType: ac.CardType
                              .masterCard, // Optional if you want to override Card Type
                          showBackSide: false,
                          frontBackground: ac.CardBackgrounds.black,
                          backBackground: ac.CardBackgrounds.white,
                          showShadow: false,
                          textExpDate: 'Exp. Date',
                          textName: 'Name',
                          textExpiry: 'MM/YY'),
                      ac.CreditCard(
                          cardNumber: debitCard.debitCardNumber != null ? debitCard.debitCardNumber.toString() : "5450 7879 4864 7854",
                          cardExpiry: debitCard.expiryDate.toString() ?? "10/25",
                          cardHolderName: debitCard.name ?? "Card Holder",
                          cvv: debitCard.cvv != null ? debitCard.cvv.toString() : "456",
                          bankName: debitCard.bankName ?? "Axis Bank",
                          cardType: ac.CardType
                              .masterCard, // Optional if you want to override Card Type
                          showBackSide: false,
                          frontBackground: ac.CardBackgrounds.black,
                          backBackground: ac.CardBackgrounds.white,
                          showShadow: false,
                          textExpDate: 'Exp. Date',
                          textName: 'Name',
                          textExpiry: 'MM/YY'),
                      Column(
                        children: [
                          Text(bank.bankName ?? "HDFC"),
                          Text(bank.name ?? "Harvey Specter"),
                          Text(bank.accNumber.toString())
                        ],
                      ),
                      Text(userWallet.name ?? "Harvey Specter"),
                      Text(userWallet.upi ?? "Google Pay"),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
