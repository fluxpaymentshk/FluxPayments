import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:flux_payments/widgets/success_snackBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPasswordOtpScreen extends StatefulWidget {
  final UserConfigRepository? userConfigRepository;
  final String? email;
  final String password;
  const ResetPasswordOtpScreen(
      {Key? key,
      @required this.userConfigRepository,
      @required this.email,
      this.password = ""})
      : super(key: key);

  @override
  _ResetPasswordOtpScreenState createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  final _otpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(UserResetPasswordEvent(email: widget.email));
    return SingleChildScrollView(
      child: BlocListener<UserBloc, UserState>(
        listener: (ctx, state) {
          if (state is UserServiceError) {
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(ctx)
                .showSnackBar(errorSnackBar(state.message));
          }
          if (state is UserResetPasswordDone) {
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(ctx).showSnackBar(successSnackBar("Success!"));
          }
          if (state is UserServiceLoading) {
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Form(
                      key: _otpFormKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Enter new password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'new Password',
                                    hintText: '******',
                                  ),
                                  validator: (s) => widget.userConfigRepository
                                      ?.validatePasswordFormField(s ?? ""),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirm Password',
                                    hintText: '******',
                                  ),
                                  validator: (s) => widget.userConfigRepository
                                      ?.validateConfirmPasswordFormField(
                                          _confirmPasswordController.value.text,
                                          _passwordController.value.text),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Email Verification',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
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
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              PinCodeTextField(
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
                              ),
                            ],
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
                            onPressed: () {},
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
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            _otpFormKey.currentState!.validate();
                            print(textEditingController.value.text);
                            userBloc.add(UserResetPasswordEvent(
                                email: widget.email,
                                code: textEditingController.value.text,
                                newPassword: _passwordController.value.text));
                            // userBloc.add();
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
                      height: 4,
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
            ),
          ],
        ),
      ),
    );
  }
}
