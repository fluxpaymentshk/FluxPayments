import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/bill_bloc/bill_bloc.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/user_model.dart';
import 'package:flux_payments/screens/coupons.dart';
import 'package:flux_payments/screens/map.dart';
import 'package:flux_payments/screens/pay_bills.dart';
import 'package:flux_payments/services/user_details_services.dart';
import 'package:flux_payments/services/database_lambda.dart';

import 'auth_Screens/login_page.dart';

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

  User user = User(firstName: '', uniqueID: '', refreeID: "ll");
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen()));
            },
            child: Icon(Icons.map_outlined),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () async {
             // _databaseLambdaService.CouponToTransaction();
              // Map<String, dynamic> c = await _databaseLambdaService.fetchCreditCardInfo(userID: "fluxsam1");
              // c.forEach((key, value) {
              //   if (key == "records") print(key + "--->" + value.toString());
              // });
              // Map<String, dynamic> d = await _databaseLambdaService.fetchDebitCardInfo(userID: "fluxsam1");
              // d.forEach((key, value) {
              //   if (key == "records") print(key + "--->" + value.toString());
              // });
              // Map<String, dynamic> d = await _databaseLambdaService.fetchbankInfo(userID: "fluxsam1");
              // d.forEach((key, value) {
              //   if (key == "records") print(key + "--->" + value.toString());
              // });
              // Map<String, dynamic> d = await _databaseLambdaService.fetchUserWalletInfo(userID: "fluxsam1");
              // d.forEach((key, value) {
              //   if (key == "records") print(key + "--->" + value.toString());
              // });
              var data = await _databaseLambdaService.getUserFavorites(userID: 'fluxsam1');
              print(data);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Fetched Records"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Icon(Icons.transform, size: 40),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Coupons()));
            },
            child: Icon(Icons.verified_user),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn4",
            onPressed: () async {
              await Amplify.Auth.signOut();
              Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            },
            child: Icon(Icons.logout),
          ),
        ],
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
                            (user.firstName) +
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
                        'DOB : \n' + (user.dateOfBirth.toString()),
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
                        'uniqueID : \n' + (user.uniqueID),
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
