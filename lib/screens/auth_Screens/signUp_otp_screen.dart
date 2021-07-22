import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_event.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpOTPScreen extends StatefulWidget {
  final String? email;
  final String password;
  const SignUpOTPScreen({Key? key, @required this.email, this.password = ""})
      : super(key: key);

  @override
  _SignUpOTPScreenState createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  final _otpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return SingleChildScrollView(
      child: BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {
            if (state is AuthError) {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(ctx)
                  .showSnackBar(errorSnackBar(state.message));
            }
            if (state is ConfirmUserState) {
              authBloc.add(EmailLogInUser(widget.email ?? "", widget.password));
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                                text: "${widget.email}",
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
                            authBloc.add(EmailSignUpUser(
                                email: widget.email,
                                password: widget.password,
                                resend: true));
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
                          authBloc.add(
                            EmailSignUpUser(
                              email: widget.email,
                              password: widget.password,
                              code: textEditingController.value.text,
                            ),
                          );
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
    );
  }
}
