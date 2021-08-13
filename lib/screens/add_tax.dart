import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_event.dart';
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/screens/provider_added.dart';
import 'package:flux_payments/screens/waiting_screen.dart';
import 'package:flux_payments/widgets/app_text_field.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/logo_with_back_button.dart';
import 'package:flux_payments/widgets/service_provider_tile.dart';
import 'package:flux_payments/widgets/subheading.dart';

class AddTax extends StatefulWidget {
  final String name, logo, billProviderID, billCategoryID;
  final String? uid;
  const AddTax(
      {required this.uid,
      required this.name,
      required this.logo,
      required this.billCategoryID,
      required this.billProviderID,
      Key? key})
      : super(key: key);

  @override
  _AddTaxState createState() => _AddTaxState();
}

class _AddTaxState extends State<AddTax> {
  final nameController = TextEditingController();
  var e = 1;

  bool isSubmitted = false;
  final _formKey = GlobalKey<FormState>();

  final businessRegistrationFeeController = TextEditingController();
  final shroffAcNumberController = TextEditingController(),
      trcAcNumberController = TextEditingController(),
      applicantNameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    businessRegistrationFeeController.dispose();
    shroffAcNumberController.dispose();
    trcAcNumberController.dispose();
    applicantNameController.dispose();

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
                        text: 'Applicant Name',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: applicantNameController),
                    appTextField(
                        text: 'Shroff Account Number',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: shroffAcNumberController),
                    appTextField(
                        text: ' TRC Account Number',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: trcAcNumberController),
                    //   Spacer(),
                    appTextField(
                        text: ' Business Registration Fee',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 45,
                        mycontroller: businessRegistrationFeeController),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * .2,
                      horizontal: SizeConfig.widthMultiplier * 3),
                  child: Container(
                      child: InkWell(
                    child: gradientButton(context, 'Confirm'),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      _formKey.currentState!.save();
                      var r = _formKey.currentState?.validate();
                      print(r);

                      if (r == true && e == 1) {
                        // setState(() {
                        //   isSubmitted = true;
                        // });
                        // print(cardHolderNumberController.text);

                        // serviceProviderBloc.add(InsertCreditCardDetails(
                        //     creditCardNumber: cardNumberController.text,
                        //     expiryDate: validDateController.text,
                        //     bankName: widget.name,
                        //     cvv: cvvNumberController.text,
                        //     holderName: cardHolderNumberController.text,
                        //     userID: 'flux-vid1',
                        //     billProviderID: widget.billProviderID));
                        print('pccccc');
                        print(businessRegistrationFeeController.text);
                        print(applicantNameController.text);
                        print(trcAcNumberController.text);
                        print(widget.billCategoryID);
                        print(widget.billProviderID);

                        serviceProviderBloc.add(InsertTaxDetails(
                            businessRegistrationFee: double.parse(
                                businessRegistrationFeeController.text),
                            shroffAcNumber: shroffAcNumberController.text,
                            trcAcNumber: trcAcNumberController.text,
                            applicantName: applicantNameController.text,
                            billCategoryID: widget.billCategoryID,
                            userID: widget.uid!,
                            billProviderID: widget.billProviderID));

                        //   e = 0;
                        //@@@@@@@@@@@@@@@@@@@@@@@@@@

                        // setState(() {
                        //   isSubmitted = false;
                        // });
                      }
                    },
                  )),
                ),
              ),

              BlocListener<ServiceProviderBloc, ServiceProviderState>(
                child: Container(),
                listener: (context, state) {
                  print('ggbhaii');
                  print(state.runtimeType.toString());
                  if (state is InsertingDetails) {
                    MaterialPageRoute(builder: (BuildContext context) {
                      return WaitingScreen();
                    });
                  }

                  if (state is InsertedDetailsSuccessfully)
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return BlocProvider<ServiceProviderBloc>.value(
                        value: serviceProviderBloc,
                        child: ProviderAdded(),
                      );
                    }));

                  if (state is ErrorInsertDetails) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(errorSnackBar(state.message));
                  }
                },
              ),
              // //#############
            ]),
          ),
        ),
      ]),
    );
  }
}
