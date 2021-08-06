import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_event.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/screens/provider_added.dart';
import 'package:flux_payments/screens/waiting_screen.dart';
import 'package:flux_payments/widgets/app_text_field.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:flux_payments/widgets/logo_with_back_button.dart';
import 'package:flux_payments/widgets/service_provider_tile.dart';
import 'package:flux_payments/widgets/subheading.dart';

class AddCreditCard extends StatefulWidget {
  final String name, logo, billProviderID;
  const AddCreditCard(
      {required this.name,
      required this.logo,
      required this.billProviderID,
      Key? key})
      : super(key: key);

  @override
  _AddCreditCardState createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  final nameController = TextEditingController();

  bool isSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController(),
      cardHolderNumberController = TextEditingController(),
      validDateController = TextEditingController(),
      cvvNumberController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardHolderNumberController.dispose();
    cardNumberController.dispose();
    cvvNumberController.dispose();
    validDateController.dispose();

    // nameCon
  }

  @override
  Widget build(BuildContext context) {
    var serviceProviderBloc = BlocProvider.of<ServiceProviderBloc>(context);

    //   var serviceProvierBloc = BlocProvider.of<ServiceProviderBloc>(context);

    //  serviceProvierBloc.add(
    //     GetServiceProviderCategoryDetails(billCategoryID: widget.categoryID));
    return Scaffold(
      body: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
             logoWithBackButton(context),
              subheading('My Providers'),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
              Card(
                elevation: 3.6,
                shape: RoundedRectangleBorder(
                    side: new BorderSide(color: AppTheme.main, width: 1.0),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.heightMultiplier * 1.1)),
                child: serviceProviderTile(
                  name: widget.name,
                  // paidOn: '',
                  imageurl: widget.logo,
                  //  amount: 100,
                ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    subheading('Input information'),
                    appTextField(
                        text: 'Card Number',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: cardNumberController),
                    appTextField(
                        text: 'Card Holder Name',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: cardHolderNumberController),
                    Row(
                      children: [
                        appTextField(
                            text: 'Valid Date',
                            height: SizeConfig.heightMultiplier * 6,
                            width: SizeConfig.widthMultiplier * 30,
                            mycontroller: validDateController),
                        Spacer(),
                        appTextField(
                            text: 'CVV Number',
                            height: SizeConfig.heightMultiplier * 6,
                            width: SizeConfig.widthMultiplier * 30,
                            mycontroller: cvvNumberController),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
               BlocListener<ServiceProviderBloc,
                                          ServiceProviderState>(
                                        listener: (context, state) {
                                          print('ggbhaii');
                                          if (state is InsertingDetails) {
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                              return WaitingScreen();
                                            });
                                          }

                                          if (state
                                              is InsertedDetailsSuccessfully)
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return BlocProvider<
                                                  ServiceProviderBloc>.value(
                                                value: serviceProviderBloc,
                                                child: ProviderAdded(),
                                              );
                                            }));

                                          if (state is ErrorInsertDetails) {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(errorSnackBar(
                                                    state.message));
                                          }
                                        },
                                       
                                      ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                  child: isSubmitted

                      // ignore: dead_code
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 90.2,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.heightMultiplier * 2)),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => isSubmitted
                                        ? Colors.grey
                                        : AppTheme.main)),
                            onPressed: isSubmitted
                                // ignore: dead_code
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    _formKey.currentState!.save();
                                    var r = _formKey.currentState?.validate();
                                    print(r);

                                    if (r == true) {
                                      // setState(() {
                                      //   isSubmitted = true;
                                      // });
                                      print(cardHolderNumberController.text);

                                      serviceProviderBloc.add(
                                          InsertCreditCardDetails(
                                              creditCardNumber:
                                                  cardNumberController.text,
                                              expiryDate:
                                                  validDateController.text,
                                              bankName: widget.name,
                                              cvv: cvvNumberController.text,
                                              holderName:
                                                  cardHolderNumberController
                                                      .text,
                                              userID: 'flux-vid1',
                                              billProviderID:
                                                  widget.billProviderID));
                                    
                                     

                                      //@@@@@@@@@@@@@@@@@@@@@@@@@@

                                      // setState(() {
                                      //   isSubmitted = false;
                                      // });
                                    }
                                  },
                            child: Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                ),
              ),

              //#############
              // Container(
              //   height: SizeConfig.heightMultiplier * 6,
              //   width: SizeConfig.widthMultiplier * 91,
              //   padding: EdgeInsets.symmetric(
              //       horizontal: SizeConfig.widthMultiplier * 1,
              //       vertical: SizeConfig.heightMultiplier * 0.2),
              //   margin:
              //       EdgeInsets.fromLTRB(0, SizeConfig.heightMultiplier * 1, 0, 0),
              //   decoration: BoxDecoration(
              //     boxShadow:
              //         //kElevationToShadow[4],
              //         [
              //       BoxShadow(
              //         color: Colors.grey.shade500,
              //         blurRadius: SizeConfig.widthMultiplier * 0.5,
              //         spreadRadius: SizeConfig.widthMultiplier * 0.05,
              //         offset: Offset(SizeConfig.widthMultiplier * 0.7,
              //             SizeConfig.heightMultiplier * 0.5),
              //       ),
              //     ],
              //     border: Border.all(
              //       color: AppTheme.main,
              //     ),
              //     borderRadius:
              //         BorderRadius.circular(SizeConfig.widthMultiplier * 3),
              //     color: AppTheme.offWhite,
              //   ),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintStyle: TextStyle(
              //         color: AppTheme.main,
              //         fontSize: SizeConfig.heightMultiplier * 2.4,
              //       ),
              //       hintText: "Search for my favorite brand",
              //       prefixIcon: Icon(
              //         Icons.search,
              //         size: SizeConfig.heightMultiplier * 4.5,
              //         color: AppTheme.main,
              //       ),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              // //),
              // SizedBox(
              //   height: SizeConfig.heightMultiplier * 2,
              // ),

              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.symmetric(
              //           horizontal: SizeConfig.widthMultiplier * 3,
              //           vertical: SizeConfig.heightMultiplier * 0.2),
              //       child: Text(
              //         widget.categoryName,
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // BlocBuilder<ServiceProviderBloc, ServiceProviderState>(
              //     builder: (context, state) {
              //   if (state is LoadingServiceProviderListState)
              //     return Center(
              //         child: CircularProgressIndicator(color: AppTheme.main));

              //   if (state is LoadServiceProviderListState) {
              //     List<Map<String, String>> ServiceProviderList =
              //         state.ServiceProviderList;
              //     return (ServiceProviderList.length!=0)
              //     ?Container(
              //       margin: EdgeInsets.symmetric(
              //         horizontal: SizeConfig.widthMultiplier * 3,
              //         vertical: SizeConfig.heightMultiplier * 2.3,
              //       ),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(
              //             Radius.circular(SizeConfig.heightMultiplier * 2)),
              //         border: Border.all(color: AppTheme.main, width: 1.0),
              //       ),
              //       height: SizeConfig.heightMultiplier * 55,
              //       child: ListView.separated(
              //           itemBuilder: (context, index) {
              //             return
              //                 //to expp
              //                 serviceProviderTile(
              //               name: ServiceProviderList[index]['name']??'',
              //              // paidOn: '',
              //               imageurl:  ServiceProviderList[index]['logo']??'',
              //             //  amount: 100,
              //             );
              //           },
              //           separatorBuilder: (context, index) {
              //             return Divider(
              //               indent: SizeConfig.widthMultiplier * 3.5,
              //               endIndent: SizeConfig.widthMultiplier * 3.5,
              //               color: Color(0xff979797),
              //               thickness: 0.8,
              //             );
              //           },
              //           itemCount: ServiceProviderList.length),

              //     )
              //     :Container(
              //         margin: EdgeInsets.symmetric(
              //         horizontal: SizeConfig.widthMultiplier * 3,
              //       //  vertical: SizeConfig.heightMultiplier * 2.2,
              //       ),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(
              //             Radius.circular(SizeConfig.heightMultiplier * 2)),
              //         border: Border.all(color: AppTheme.main, width: 1.0),
              //       ),
              //       height: SizeConfig.heightMultiplier * 15,
              //       child:Center(child: Text('Sorry, No provider is there in the given category!')),
              //     );
              //   }
              //   if (state is ErrorServiceProviderListState)
              //     return Center(child: Text(state.message));
              //   else
              //     return Center(
              //         child: Text('event not fired or state is incorrect!'));
              // }),
            ]),
          ),
        ),
      ]),
    );
  }
}
