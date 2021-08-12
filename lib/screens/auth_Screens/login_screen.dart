import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
import 'package:flux_payments/bloc/service_provider_bloc/service_provider_bloc.dart';
import 'package:flux_payments/bloc/story_bloc/story_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/forgot_password_screen.dart';
import 'package:flux_payments/screens/auth_Screens/register_page.dart';
import 'package:flux_payments/screens/auth_Screens/register_screen.dart';
import 'package:flux_payments/screens/auth_Screens/signUp_otp_screen.dart';
import 'package:flux_payments/screens/navigator_page.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  final LoginRepository? loginRepo;
  final UserConfigRepository? userConfigRepository;
  final DatabaseRepository? databaseRepository;
  LoginScreen(
      {Key? key,
      @required this.databaseRepository,
      @required this.loginRepo,
      @required this.userConfigRepository})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserConfigRepository userConfigRepository = UserConfigRepository();
  final Shader linearGradientText = LinearGradient(
    colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
  bool hidePassword = true;
  bool isSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    var authBloc = BlocProvider.of<AuthBloc>(context);
    var userBloc = BlocProvider.of<UserBloc>(context);
    var curatedListBloc = BlocProvider.of<CuratedListBloc>(context);
    var advertiserBloc = BlocProvider.of<AdvertiserBloc>(context);
    var bannerBloc = BlocProvider.of<BannerBloc>(context);
    var graphBloc = BlocProvider.of<GraphBloc>(context);
    var storyBloc = BlocProvider.of<StoryBloc>(context);

    var pendingServiceBloc = BlocProvider.of<PendingServiceBloc>(context);
    var recentPaymentBloc = BlocProvider.of<RecentPaymentBloc>(context);
    var favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    var couponsBloc = BlocProvider.of<CouponsBloc>(context);
    var serviceP = BlocProvider.of<ServiceProviderBloc>(context);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash Screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (ctx, state) async {
              print("Submitted:            $isSubmitted");
              if (state is AuthError) {
                print("-------------------------AUTH ERROR===${state.message}");
                if (state.message == "User not confirmed") {
                  log("hi");
                  Navigator.of(ctx).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: authBloc,
                        child: Scaffold(
                          body: SignUpOTPScreen(
                            email: _emailController.value.text.trim(),
                            password: _passwordController.value.text,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(ctx)
                      .showSnackBar(errorSnackBar(state.message));
                }
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
              if (state is UserSignedInAuthState) {
                var userdetails = await userConfigRepository.fetchUserDetails();
                log(userdetails.userSub.toString());
                SizeConfig.userID = userdetails.userSub!;
                log(SizeConfig.userID);
                log("777777777777777777777777777777777");
                Navigator.of(ctx).pop();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: userBloc,
                        ),
                        BlocProvider.value(
                          value: curatedListBloc,
                        ),
                        BlocProvider.value(
                          value: bannerBloc,
                        ),
                        BlocProvider.value(
                          value: advertiserBloc,
                        ),
                        BlocProvider.value(
                          value: graphBloc,
                        ),
                        BlocProvider.value(
                          value: recentPaymentBloc,
                        ),
                        BlocProvider.value(
                          value: pendingServiceBloc,
                        ),
                        BlocProvider.value(
                          value: storyBloc,
                        ),
                        BlocProvider.value(
                          value: couponsBloc,
                        ),
                        BlocProvider.value(
                          value: favoritesBloc,
                        ),
                        BlocProvider.value(
                          value: serviceP,
                        ),
                      ],
                      child: NavigatorPage(
                        userRepository: widget.userConfigRepository,
                        databaseRepository: DatabaseRepository(),
                      ),
                    ),
                  ),
                );
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: height * 0.35,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    //height: height * 0.065,
                    //width: width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                          color: Colors.black, fontSize: height * 0.025),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (s) =>
                          widget.loginRepo?.validateField(s ?? ""),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    //height: height * 0.065,
                    //width: width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      cursorHeight: height * 0.04,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025),
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
                          child: Icon(hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (s) {
                        return widget.loginRepo
                            ?.validatePasswordFormField(s ?? "");
                      },
                    ),
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
                        "Login",
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradientText,
                        ),
                      ),
                      onPressed:() {
                              FocusScope.of(context).unfocus();
                              var r = _formKey.currentState?.validate();
                              print(r);
                              if (r == true) {
                                // setState(() {
                                //   isSubmitted = true;
                                // });
                                print(_emailController.value.text);
                                print(_passwordController.value.text);
                                authBloc.add(EmailLogInUser(
                                    _emailController.value.text.trim(),
                                    _passwordController.value.text));
                                // setState(() {
                                //   isSubmitted = false;
                                // });
                              }
                            },
                    ),
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
                        "I don't have a Flux account",
                        style: TextStyle(
                          fontSize: height * 0.02,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (_) => MultiBlocProvider(
                        //       providers: [
                        //         BlocProvider.value(
                        //           value: authBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: userBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: curatedListBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: bannerBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: advertiserBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: graphBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: recentPaymentBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: pendingServiceBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: storyBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: couponsBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: favoritesBloc,
                        //         ),
                        //         BlocProvider.value(
                        //           value: serviceP,
                        //         ),
                        //       ],
                        //       child: 
                        //       RegisterScreen(
                        //         userConfigRepository:
                        //             widget.userConfigRepository,
                        //         loginRepo: widget.loginRepo,
                        //       ),
                        //     ),
                        //   ),
                        // );
                        //         Navigator.pushReplacement(
                        // context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
