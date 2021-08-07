import 'package:flux_payments/screens/auth_Screens/login_screen.dart';
import 'package:flux_payments/screens/navigator_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/advertiser_bloc/advertiser_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_event.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/banner_bloc/banner_bloc.dart';
import 'package:flux_payments/bloc/coupons_bloc/coupons_bloc.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_bloc.dart';
import 'package:flux_payments/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flux_payments/bloc/graph_bloc/graph_bloc.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_bloc.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_bloc.dart';
import 'package:flux_payments/bloc/story_bloc/story_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/login_page.dart';
import 'package:flux_payments/screens/auth_Screens/signUp_otp_screen.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../bloc/auth_bloc/auth_state.dart';
import '../home_page.dart';

class RegisterScreen extends StatefulWidget {
  final LoginRepository? loginRepo;
  final UserConfigRepository? userConfigRepository;
  RegisterScreen(
      {Key? key, @required this.loginRepo, @required this.userConfigRepository})
      : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserConfigRepository userConfigRepository = UserConfigRepository();
  final _registerFormKey = GlobalKey<FormState>();
  final _oneformkey = GlobalKey<FormState>();
  final _twoformkey = GlobalKey<FormState>();
  final _three1formkey = GlobalKey<FormState>();
  final _three2formkey = GlobalKey<FormState>();
  final _fourformkey = GlobalKey<FormState>();
  String? phnNumber = "";
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _fnameController = new TextEditingController();
  final TextEditingController _lnameController = new TextEditingController();
  final TextEditingController _identitycontroller = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _otpController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  final TextEditingController _phnController = new TextEditingController();
  bool hidePassword = true;
  bool hideCPassword = true;
  bool promotion = false;
  bool tnc = false;
  Color _color = Color(0xFF7041EE);
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  bool enterOtp = false;
  var authBloc;
  var userBloc;
  var curatedListBloc;
  var advertiserBloc;
  var bannerBloc;
  var graphBloc;
  var storyBloc;
  var pendingServiceBloc;
  var recentPaymentBloc;
  var favoritesBloc;
  var couponsBloc;
  DatabaseRepository _databaseRepository = DatabaseRepository();

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    userBloc = BlocProvider.of<UserBloc>(context);
    curatedListBloc = BlocProvider.of<CuratedListBloc>(context);
    advertiserBloc = BlocProvider.of<AdvertiserBloc>(context);
    bannerBloc = BlocProvider.of<BannerBloc>(context);
    graphBloc = BlocProvider.of<GraphBloc>(context);
    storyBloc = BlocProvider.of<StoryBloc>(context);
    pendingServiceBloc = BlocProvider.of<PendingServiceBloc>(context);
    recentPaymentBloc = BlocProvider.of<RecentPaymentBloc>(context);
    favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    couponsBloc = BlocProvider.of<CouponsBloc>(context);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    setState(() {});
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Splash Screen.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Flux.",
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                child: NumberStepper(
                  scrollingDisabled: true,
                  stepRadius: width * 0.08,
                  lineLength: width * 0.07,
                  enableNextPreviousButtons: false,
                  enableStepTapping: true,
                  stepColor: Colors.grey,
                  activeStepColor: Colors.white,
                  lineColor: Colors.white,
                  numbers: [
                    1,
                    2,
                    3,
                    4,
                  ],
                  activeStep: activeStep,
                  //steppingEnabled: true,
                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
              ),
              _widget(height, width),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  Widget _widget(height, width) {
    switch (activeStep) {
      case 1:
        return _TwoScreen(height, width);
      case 2:
        return _FourScreen(height, width);
      case 3:
        return enterOtp
            ? _ThreeScreen2(height, width)
            : _ThreeScreen1(height, width);
      default:
        return _OneScreen(height, width);
    }
  }

  Widget _OneScreen(
    height,
    width,
  ) {
    return Form(
      key: _oneformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "First Name",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black, fontSize: height * 0.025),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: _fnameController,
              validator: (s) => widget.loginRepo?.validateField(s ?? ""),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "Last Name",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.black, fontSize: height * 0.025),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: _lnameController,
              validator: (s) => widget.loginRepo?.validateField(s ?? ""),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Container(
            //height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: _color,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  var r = _oneformkey.currentState?.validate();
                  print(r);
                  if (r == true) {
                    if (activeStep < upperBound) {
                      setState(() {
                        activeStep++;
                      });
                    }
                  }
                }),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            height: height * 0.065,
            width: width * 0.9,
            child: TextButton(
              child: Text(
                "I already have a Flux account",
                style: TextStyle(
                  fontSize: height * 0.02,
                  //fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginPage(
                              loginRepo: widget.loginRepo,
                              userConfigRepository: widget.userConfigRepository,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _TwoScreen(height, width) {
    return Form(
      key: _twoformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "HKID / Passport ID",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: _identitycontroller,
              style: TextStyle(color: Colors.black, fontSize: height * 0.025),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              validator: (s) => widget.loginRepo?.validateField(s ?? ""),
            ),
          ),
          SizedBox(
            height: height * 0.4,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              child: Text(
                "Scan my identity card",
                style: TextStyle(
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: _color,
                ),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                var r = _twoformkey.currentState?.validate();
                print(r);
                if (r == true) {
                  if (activeStep < upperBound) {
                    setState(() {
                      activeStep++;
                    });
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _ThreeScreen1(height, width) {
    return Form(
      key: _three1formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Email",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: _emailController,
              style: TextStyle(color: Colors.black, fontSize: height * 0.025),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              validator: (s) =>
                  widget.loginRepo?.validateEmailFormField(s ?? ""),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "Password",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: _passwordController,
              cursorHeight: height * 0.04,
              style: TextStyle(
                  color: hidePassword ? Color(0xff7041EE) : Colors.black,
                  fontSize: hidePassword ? height * 0.05 : height * 0.025),
              obscureText: hidePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (s) =>
                  widget.loginRepo?.validatePasswordFormField(s ?? ""),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "Confirm Password",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: _confirmPasswordController,
              cursorHeight: height * 0.04,
              style: TextStyle(
                  color: hideCPassword ? Color(0xff7041EE) : Colors.black,
                  fontSize: hideCPassword ? height * 0.05 : height * 0.025),
              obscureText: hideCPassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      hideCPassword = !hideCPassword;
                    });
                  },
                  child: Icon(
                      hideCPassword ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (s) => widget.loginRepo
                  ?.validateConfirmPasswordFormField(
                      _confirmPasswordController.value.text,
                      _passwordController.value.text),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (ctx, state) {
                if (state is AuthError) {
                  Navigator.of(ctx).pop();
                  print(
                      "-------------------------AUTH ERROR===${state.message}");
                  ScaffoldMessenger.of(ctx)
                      .showSnackBar(errorSnackBar(state.message));
                }
                if (state is AuthStateLoading) {
                  showDialog(
                      context: ctx,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                }
                if (state is AuthInitial) {
                  print("-++++AUTH INITIAL");
                }
                if (state is UserSignedUpAuthState) {
                  Navigator.of(ctx).pop();
                  Navigator.of(ctx).pop();
                  enterOtp = true;
                  log("3333333333333333333333${_fnameController.value.text}22222");
                  setState(() {});
                  log("88888888888888888888888${_fnameController.value.text}22222");
                  print("===++++________________User signed in");
                }
              },
              child: TextButton(
                child: Text(
                  "Send verification code",
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: _color,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  var r = _three1formkey.currentState?.validate();
                  if (r == true) {
                    // setState(() {
                    //   enterOtp = true;
                    // });
                    authBloc.add(
                      EmailSignUpUser(
                        email: _emailController.value.text.trim(),
                        password: _passwordController.value.text,
                        phnNumber: _phnController.value.text,
                        fname: _fnameController.value.text,
                        lname: _lnameController.value.text,
                        hkid: _identitycontroller.value.text,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ThreeScreen2(height, width) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) async {
        print(state);
        log("___________________________________________________________$state");
        if (state is AuthError) {
          Navigator.of(ctx).pop();
          print("-------------------------AUTH ERROR===${state.message}");
          ScaffoldMessenger.of(ctx).showSnackBar(errorSnackBar(state.message));
        }
        if (state is AuthStateLoading) {
          showDialog(
              context: ctx,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }
        if (state is AuthInitial) {
          print("-++++AUTH INITIAL");
        }
        if (state is OtpResentState) {
          Navigator.of(ctx).pop();
          Navigator.of(ctx).pop();
          print("OTP Resent");
        }
        if (state is ConfirmUserState) {
          Navigator.of(ctx).pop();
          Navigator.of(ctx).pop();
          //Navigator.of(ctx).pop();
          authBloc.add(EmailLogInUser(
              _emailController.value.text, _passwordController.value.text));
        }
        if (state is UserSignedUpAuthState) {
          enterOtp = true;
          setState(() {});
          Navigator.of(ctx).pop();
          Navigator.of(ctx).pop();
          Navigator.of(ctx).pop();
          print("===++++________________User signed in");
        }
          if (state is UserSignedInAuthState) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          log("44444444444444444444444444${_fnameController.value.text}22222");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<UserBloc>.value(
                      value: userBloc,
                    ),
                    BlocProvider<CuratedListBloc>.value(
                      value: curatedListBloc,
                    ),
                    BlocProvider<BannerBloc>.value(
                      value: bannerBloc,
                    ),
                    BlocProvider<AdvertiserBloc>.value(
                      value: advertiserBloc,
                    ),
                    BlocProvider<GraphBloc>.value(
                      value: graphBloc,
                    ),
                    BlocProvider<RecentPaymentBloc>.value(
                      value: recentPaymentBloc,
                    ),
                    BlocProvider<PendingServiceBloc>.value(
                      value: pendingServiceBloc,
                    ),
                    BlocProvider<StoryBloc>.value(
                      value: storyBloc,
                    ),
                    BlocProvider<CouponsBloc>.value(
                      value: couponsBloc,
                    ),
                    BlocProvider<FavoritesBloc>.value(
                      value: favoritesBloc,
                    ),
                  ],
                  child: NavigatorPage(
                      userRepository: widget.userConfigRepository,
                      databaseRepository: DatabaseRepository(),
                      register: true,
                    email: _emailController.value.text,
                    fname: _fnameController.value.text,
                    hkID: _identitycontroller.value.text,
                    lname: _lnameController.value.text,
                    phnNumber: _phnController.value.text,
                    ),
                  //  child:ProfilePage(),
                ),
              ),
            );
          }
        
      },
      child: Form(
        key: _three2formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.065,
              width: width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: _otpController,
                validator: (v) {
                  if (v!.length < 6) {
                    return "Fill the form";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black, fontSize: height * 0.025),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.33,
            ),
            Container(
              height: height * 0.065,
              width: width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: _color,
                    ),
                  ),
                  onPressed: () {
                    _three2formkey.currentState!.validate();
                    authBloc.add(
                      EmailSignUpUser(
                        email: _emailController.value.text,
                        password: _passwordController.value.text,
                        code: _otpController.value.text,
                        fname: _fnameController.value.text,
                        lname: _lnameController.value.text,
                        hkid: _identitycontroller.value.text,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.065,
              width: width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                child: Text(
                  "Resend",
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: _color,
                  ),
                ),
                onPressed: () {
                  authBloc.add(EmailSignUpUser(
                    email: _emailController.value.text,
                    password: _passwordController.value.text,
                    resend: true,
                    fname: _fnameController.value.text,
                    lname: _lnameController.value.text,
                    hkid: _identitycontroller.value.text,
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _FourScreen(height, width) {
    return Form(
      key: _fourformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Enter Phone Number",
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: _phnController,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black, fontSize: height * 0.025),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              validator: (v) {
                if (v!.length < 6) {
                  return "Fill the form";
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: height * 0.28,
          ),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  //selectedTileColor: Colors.white,
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  //tileColor: Colors.white,
                  //contentPadding: EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //title: Text("Subscribe me for Flux's newest promotions", style: TextStyle(color: Colors.white),),
                  value: promotion,
                  onChanged: (value) {
                    setState(() {
                      promotion = value!;
                    });
                  },
                  //controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Text(
                "Subscribe me for Flux's newest promotions",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          //SizedBox(height: height*0.01,),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  //contentPadding: EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //title: Text("I accept Flux's Terms & Conditions" , style: TextStyle(color: Colors.white),),
                  value: tnc,
                  onChanged: (value) {
                    setState(() {
                      tnc = value!;
                    });
                  },
                  //controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Text(
                "I accept Flux's Terms & Conditions",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            height: height * 0.065,
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: _color,
                ),
              ),
              onPressed: () {
                _fourformkey.currentState!.validate();
              },
            ),
          ),
        ],
      ),
    );
  }
}
