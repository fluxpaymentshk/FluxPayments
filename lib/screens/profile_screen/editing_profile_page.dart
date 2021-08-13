import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/profile_screen/settings_screen.dart';
import 'package:flux_payments/screens/profile_screen/update_Profile_otp_screen.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/services/login_req.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/success_snackBar.dart';
import 'package:google_fonts/google_fonts.dart';

class EditingProfilePage extends StatefulWidget {
  final User? user;
  const EditingProfilePage({Key? key, @required this.user}) : super(key: key);

  @override
  _EditingProfilePageState createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  var _profileFormKey = GlobalKey<FormState>();
  FormValidator _formValidator = FormValidator();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _firstNameController = TextEditingController();
  late TextEditingController _lastNameController = TextEditingController();
  late TextEditingController _hkIDController = TextEditingController();
  late TextEditingController _phnNumberController = TextEditingController();
  @override
  void initState() {
    _emailController = TextEditingController(text: widget.user!.email);
    _firstNameController = TextEditingController(text: widget.user!.firstName);
    _lastNameController = TextEditingController(text: widget.user!.lastName);
    _hkIDController = TextEditingController(text: widget.user!.hkID);
    _phnNumberController =
        TextEditingController(text: widget.user!.mobileNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = widget.user!;
    var userBloc = BlocProvider.of<UserBloc>(context);
    log("_----$user");
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, "editingProfilePage"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: BlocListener<UserBloc, UserState>(
        listener: (ctx, state) {
          if (state is UserDetailsUpdating &&
              widget.user!.email == _emailController.value.text) {
            showDialog(
                context: ctx,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          } else if (state is UserServiceDone) {
            Navigator.of(ctx).pop();
            Navigator.of(ctx).pushReplacement(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: userBloc,
                  child: SettingsPage(
                    user: User(
                      id: widget.user!.id,
                      uniqueID: "",
                      referralID: widget.user!.referralID,
                      lastName: _lastNameController.value.text,
                      firstName: _firstNameController.value.text,
                      email: _emailController.value.text,
                      mobileNumber: _phnNumberController.value.text,
                      refreeID: widget.user!.refreeID,
                      hkID: _hkIDController.value.text,
                    ),
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
        child: ListView(
          padding: EdgeInsets.fromLTRB(8, 38, 16, 8),
          children: [
            fluxLogo(context),
            Form(
              key: _profileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                    // padding: EdgeInsets.only(left: 16, top: 8),

                    child: TextFormField(
                      controller: _emailController,
                      // initialValue: widget.user!.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'xyz@abc.com',
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                      validator: (s) => _formValidator.validateEmail(s!),
                    ),
                  ),
                  Text("First Name"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                    // padding: EdgeInsets.only(left: 16, top: 8),

                    child: TextFormField(
                      controller: _firstNameController,
                      // initialValue: widget.user!.firstName,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'First Name',
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text("Last Name"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                    child: TextFormField(
                      controller: _lastNameController,
                      // initialValue: widget.user!.lastName,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'last name',
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text("HKID"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                    // padding: EdgeInsets.only(left: 16, top: 8),

                    child: TextFormField(
                      controller: _hkIDController,
                      // initialValue: widget.user!.hkID,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'HKID',
                        hintText: '0000 0 0000',
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text("PHN Number"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                    // padding: EdgeInsets.only(left: 16, top: 8),

                    child: TextFormField(
                      controller: _phnNumberController,
                      // initialValue: widget.user!.mobileNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'Mobile Number',
                      ),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                      validator: (s) => _formValidator.validatePhnNumber(s!),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (_profileFormKey.currentState!.validate()) {
                  log("${widget.user!.email} == ${_emailController.value.text}");
                  ;
                  if (widget.user!.email == _emailController.value.text) {
                    userBloc.add(
                      UpdateUserDetails(
                        isDBChange: true,
                        userID: widget.user!.id,
                        lastName: _lastNameController.value.text,
                        firstName: _firstNameController.value.text,
                        email: _emailController.value.text,
                        phnNumber: _phnNumberController.value.text,
                        hkID: _hkIDController.value.text,
                      ),
                    );
                  } else {
                    userBloc.add(
                      UpdateUserDetails(
                        userID: widget.user!.id,
                        lastName: _lastNameController.value.text,
                        firstName: _firstNameController.value.text,
                        email: _emailController.value.text,
                        phnNumber: _phnNumberController.value.text,
                        hkID: _hkIDController.value.text,
                      ),
                    );
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => BlocProvider.value(
                    //       value: userBloc,
                    //       child: UpdateProfileOTPScreen(
                    //         user: User(
                    //           id: widget.user!.id,
                    //           uniqueID: "",
                    //           referralID: widget.user!.referralID,
                    //           lastName: _lastNameController.value.text,
                    //           firstName: _firstNameController.value.text,
                    //           email: _emailController.value.text,
                    //           mobileNumber: _phnNumberController.value.text,
                    //           refreeID: widget.user!.refreeID,
                    //           hkID: _hkIDController.value.text,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  }
                  // user.copyWith(
                  //   id: widget.user!.id,
                  //   uniqueID: widget.user!.uniqueID,
                  //   referralID: widget.user!.referralID,

                  //   refreeID:widget.user!.refreeID,
                  //   lastName: _lastNameController.value.text,
                  //   firstName: _firstNameController.value.text,
                  //   email: _emailController.value.text,
                  //   mobileNumber: _phnNumberController.value.text,
                  //   hkID: _hkIDController.value.text,
                  // );
                }
              },
              child: gradientButton(context, "Update Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
