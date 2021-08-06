import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/change_password.dart';
import 'package:flux_payments/screens/profile_screen/settings_screen.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/hello_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  final DatabaseRepository? databaseRepository;
  final UserConfigRepository? userConfigRepository;
  ProfilePage({Key? key, this.databaseRepository, this.userConfigRepository})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(GetUserDetails(userID: "Flux-Monik"));
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, "profilePage"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserDetails) {
          User user = state.user;
          return ListView(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            children: [
              fluxLogo(context),
              Text(
                "Personal Information",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      minRadius: MediaQuery.of(context).size.height * 0.07,
                      backgroundImage: AssetImage(
                        "assets/icons/user_avatar.png",
                      ),
                    ),
                    TextButton(
                        child: Text(
                          "Change Profile Picture",
                          style: GoogleFonts.montserrat(
                            color: AppTheme.main,
                          ),
                        ),
                        onPressed: () {}),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                  value: userBloc,
                                  child: SettingsPage(user: user)),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.settings,
                          color: AppTheme.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Email"),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                padding: EdgeInsets.only(left: 16, top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.main),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  user.email!,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ),
              Text("First Name"),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                padding: EdgeInsets.only(left: 16, top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.main),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  user.firstName,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ),
              Text("Last Name"),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                padding: EdgeInsets.only(left: 16, top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.main),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  user.lastName!,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ),
              Text("HKID"),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                padding: EdgeInsets.only(left: 16, top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.main),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  user.hkID??"",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ),
              Text("PHN Number"),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.fromLTRB(0, 8, 8, 16),
                padding: EdgeInsets.only(left: 16, top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.main),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  user.mobileNumber!,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Change Password",
                    style: GoogleFonts.montserrat(
                      color: AppTheme.main,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<UserBloc>(context),
                          child: ChangePassword(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is UserDetailsError) {
          return Center(
            child: Container(
              child: Text(state.message),
            ),
          );
        }
        // if (state is UserDetailsLoading) {
        return Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        );
        // }
      }),
    );
  }
}
