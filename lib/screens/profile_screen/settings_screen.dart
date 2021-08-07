import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/screens/profile_screen/editing_profile_page.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/hello_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  final User? user;
  SettingsPage({Key? key, this.user}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

String selectedLanguage = "English";
String selectedCurrency = "HKD";

class _SettingsPageState extends State<SettingsPage> {
  int? radioValue = -1;
  int? currRadioValue = -1;
  String selectedLanguage = "English";
  String selectedCurrency = "HKD";
  List<String> languages = ["english", "Mandarin", "Chinese-simplified"];
  List<String> currencies = ["HKD", "RMD", "USD"];
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backButton(context, "settingsPage"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: ListView(
        children: [
          fluxLogo(context),
          helloWidget("Shourya", context),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: userBloc,
                        child: EditingProfilePage(user: widget.user))));
              },
              child: tile("Update Profile"),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: InkWell(
              onTap: () {
                showGeneralDialog(
                  barrierLabel: "language",
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0),
                  transitionDuration: Duration(milliseconds: 700),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return StatefulBuilder(builder: (context, setState) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 250,
                          // padding:EdgeInsets.all(8),
                          child: Scaffold(
                            backgroundColor: Color(0xffE9E9FF),
                            body: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                ListTile(
                                  title: Text("Choose Language"),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: AppTheme.main,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                for (int i = 0; i < languages.length; i++)
                                  Card(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    color: Color(0xffE9E9FF),
                                    elevation: 4,
                                    child: ListTile(
                                      title: Text(languages[i]),
                                      trailing: Radio<int>(
                                        activeColor: AppTheme.main,
                                        value: i,
                                        groupValue: radioValue,
                                        // toggleable: true,
                                        onChanged: (v) {
                                          setState(() {
                                            radioValue = v;
                                            selectedLanguage = languages[i];
                                            log("$radioValue");
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          margin:
                              EdgeInsets.only(bottom: 12, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: Color(0xffE9E9FF),
                            // borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      );
                    });
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: tile(
                "Change Language",
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          selectedLanguage.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: AppTheme.main,
                          ),
                        ),
                      ),
                      forwardButton("LangForwardButton"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: InkWell(
              onTap: () {
                showGeneralDialog(
                  barrierLabel: "currencyTag",
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0),
                  transitionDuration: Duration(milliseconds: 700),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return StatefulBuilder(builder: (context, setState) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 250,
                          // padding:EdgeInsets.all(8),
                          child: Scaffold(
                            backgroundColor: Color(0xffE9E9FF),
                            body: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                ListTile(
                                  title: Text("Choose Language"),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: AppTheme.main,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                for (int i = 0; i < currencies.length; i++)
                                  Card(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    color: Color(0xffE9E9FF),
                                    elevation: 4,
                                    child: ListTile(
                                      title: Text(currencies[i]),
                                      trailing: Radio<int>(
                                        activeColor: AppTheme.main,
                                        value: i,
                                        groupValue: currRadioValue,
                                        // toggleable: true,
                                        onChanged: (v) {
                                          setState(() {
                                            currRadioValue = v;
                                            selectedCurrency = currencies[i];
                                            log("$currRadioValue");
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          margin:
                              EdgeInsets.only(bottom: 12, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: Color(0xffE9E9FF),
                            // borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      );
                    });
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: tile(
                "Change Currency",
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        selectedCurrency.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: AppTheme.main,
                        ),
                      ),
                      forwardButton("currencyForwardButton"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: InkWell(
              onTap: () {},
              child: tile("Notification"),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: InkWell(
              onTap: () {},
              child: tile("Contact Us"),
            ),
          ),
        ],
      ),
    );
  }

  Widget tile(String text, [Widget? trailing]) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          side: BorderSide(
            color: AppTheme.main,
          ),
        ),
        elevation: 4,
        child: ListTile(
          dense: true,
          leading: Text(
            text,
            style: GoogleFonts.montserrat(fontSize: 15),
          ),
          trailing: trailing,
        ),
      ),
    );
  }

  Widget forwardButton(String tag) {
    return Container(
      height: 25,
      child: FloatingActionButton(
        heroTag: tag,
        shape: CircleBorder(
          side: BorderSide(
            color: AppTheme.main,
            width: 2.5,
          ),
        ),
        backgroundColor: Colors.white,
        mini: true,
        child: Icon(
          Icons.arrow_right_alt_rounded,
          color: AppTheme.main,
          size: 20,
        ),
        onPressed: null,
      ),
    );
  }
}
