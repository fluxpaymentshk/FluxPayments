import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/profile_screen/settings_screen.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UpdateProfileOTPScreen extends StatefulWidget {
  final User? user;
  const UpdateProfileOTPScreen({Key? key, this.user}) : super(key: key);

  @override
  _UpdateProfileOTPScreenState createState() => _UpdateProfileOTPScreenState();
}

class _UpdateProfileOTPScreenState extends State<UpdateProfileOTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  final _otpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<UserBloc, UserState>(
            listener: (ctx, state) {
              log("**&&&**$state");
              if (state is UserServiceError) {
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                  content: Text(
                    "Error updating details",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
              if (state is ConfirmUpdateUserState) {
                // authBloc.add(EmailLogInUser(widget.email ?? "", widget.password));
                Navigator.of(context).pop();
                userBloc.add(
                  UpdateUserDetails(
                    isDBChange: true,
                    userID: widget.user!.id,
                    lastName: widget.user!.lastName,
                    firstName: widget.user!.firstName,
                    email: widget.user!.email,
                    phnNumber: widget.user!.mobileNumber,
                    hkID: widget.user!.hkID,
                  ),
                );
              }
              if (state is CheckOTPScreen) {
                showDialog(
                    context: ctx,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              }
              if (state is UserServiceDone) {
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: userBloc,
                      child: SettingsPage(
                        user: widget.user,
                      ),
                    ),
                  ),
                );
                //  Navigator.popUntil(context, ModalRoute.withName('/login'));
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Success updating details",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is UserDetailsError) {
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                  content: Text(
                    "Error updating details",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Email Verification',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            text: "Enter the code sent to ",
                            children: [
                              TextSpan(
                                  text: "${widget.user!.email}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _otpFormKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 6) {
                                return "Fill the form";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              activeFillColor: Colors.blue.shade100,
                              inactiveFillColor: Colors.green[50],
                            ),
                            cursorColor: Colors.yellow,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              // authBloc.add(EmailSignUpUser(
                              //     email: widget.email,
                              //     password: widget.password,
                              //     resend: true));
                            },
                            child: Text(
                              "RESEND",
                              style: TextStyle(
                                  color: Color(0xFF91D3B3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            _otpFormKey.currentState!.validate();
                            print(textEditingController.value.text);
                            userBloc.add(
                              UpdateUserDetails(
                                isDBChange: false,
                                userID: widget.user!.id,
                                lastName: widget.user!.lastName,
                                firstName: widget.user!.firstName,
                                email: widget.user!.email,
                                phnNumber: widget.user!.mobileNumber,
                                hkID: widget.user!.hkID,
                                code: textEditingController.value.text,
                              ),
                            );
                            // authBloc.add(
                            //   EmailSignUpUser(
                            //     email: widget.email,
                            //     password: widget.password,
                            //     code: textEditingController.value.text,
                            //   ),
                            // );
                          },
                          child: Center(
                              child: Text(
                            "Verify the code".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Flexible(
                        child: TextButton(
                      child: Text("Clear"),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
