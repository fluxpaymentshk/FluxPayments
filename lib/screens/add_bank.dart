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
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/logo_with_back_button.dart';
import 'package:flux_payments/widgets/service_provider_tile.dart';
import 'package:flux_payments/widgets/subheading.dart';

class AddBank extends StatefulWidget {
  final String name, logo, billProviderID, billCategoryID;
  const AddBank(
      {required this.name,
      required this.logo,
      required this.billCategoryID,
      required this.billProviderID,
      Key? key})
      : super(key: key);

  @override
  _AddBankState createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  var e = 1;

  bool isSubmitted = false;
  final _formKey = GlobalKey<FormState>();

  final ifscController = TextEditingController();
  final nameController = TextEditingController();
  final acNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ifscController.dispose();
    nameController.dispose();
    acNumberController.dispose();
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
                        text: 'Account Holder Name',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: nameController),
                    appTextField(
                        text: 'Account Number',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: acNumberController),
                    appTextField(
                        text: 'IFSC Code',
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 90.3,
                        mycontroller: ifscController),
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

                        print(nameController.text);
                        print('vvvvvvvvvvvvvvvvvvvvv');

                        serviceProviderBloc.add(InsertBankDetails(
                            userID: 'flux-vid1',
                            billProviderID: widget.billProviderID,
                            acHolderName: nameController.text,
                            accNumber: acNumberController.text,
                            ifscCode: ifscController.text,
                            bankName: widget.name));
                         
                         print('gggg_Hhhh');
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
                child:Container(),
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
