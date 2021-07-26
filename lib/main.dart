import 'dart:async';
import 'dart:developer';
import 'package:flux_payments/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flux_payments/bloc/story_bloc/story_bloc.dart';
import 'package:flux_payments/repository/database_repo.dart';

import './screens/coupons.dart';

import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flux_payments/amplifyconfiguration.dart';
import 'package:flux_payments/bloc/advertiser_bloc/advertiser_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_bloc.dart';
import 'package:flux_payments/notification_handler.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/login_page.dart';
import 'package:flux_payments/screens/home_page.dart';
import 'package:flux_payments/screens/navigator_page.dart';

import 'package:flux_payments/services/database_lambda.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/coupons_bloc/coupons_bloc.dart';
import 'bloc/banner_bloc/banner_bloc.dart';
import 'bloc/graph_bloc/graph_bloc.dart';
import 'bloc/recent_payment_bloc/recent_payment_bloc.dart';


List<types.Message> messages = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//  ));
  NotificationHandler? _notificationHandler = NotificationHandler();

  try {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    print(e);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("${message.data}");
    if (message.data != null) {
      log("hey");
      _notificationHandler.firebaseMessagingForegroundHandler(message);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginRepository _loginRepository = new LoginRepository();
  UserConfigRepository _userConfigRepository = new UserConfigRepository();
  DatabaseRepository _databaseRepository = DatabaseRepository();

  bool _amplifyConfigured = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAPI amplifyAPI = AmplifyAPI();
    Amplify.addPlugins([authPlugin, amplifyAPI, analyticsPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Map<String, String> userDetails = {};
  Future<void> checkUserDetail() async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        userDetails[element.userAttributeKey] = element.value;
        String email = "";
        // l?.forEach((element) {
        if (element.userAttributeKey == "email") {
          print("--------${element.value}");
          email = element.value;
        }
      });
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<bool> currentUser(context) async {
    var emailLoginBloc = BlocProvider.of<AuthBloc>(context);
    isSignedIn = await emailLoginBloc.currentUser;

    return isSignedIn;
  }

  var authBloc;
  var userBloc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flux Payments',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Color(0xff7041EE),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xff7041EE),
          unselectedItemColor: Color(0xff7041EE),
          selectedLabelStyle:
              TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 30),
        ),
      ),
      home:
          //  SupportBotScreen()
          MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(_loginRepository),
          ),
          BlocProvider(
            create: (_) => UserBloc(_userConfigRepository,_databaseRepository),
          ),
            BlocProvider(create: (_) => AdvertiserBloc(_databaseRepository)),
                BlocProvider(create: (_)=>CuratedListBloc(_databaseRepository)),
                     BlocProvider(create: (_)=>BannerBloc(_databaseRepository)),
                     BlocProvider(create: (_)=>GraphBloc(_databaseRepository)),
                      BlocProvider(create: (_)=>RecentPaymentBloc(_databaseRepository)),

  BlocProvider(create: (_)=>PendingServiceBloc(_databaseRepository))

        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prevSt, newSt) {
            return !(prevSt is UserSignedInAuthState) && newSt is AuthInitial;
          },
          builder: (ctx, st) {
            log(_amplifyConfigured.toString());
            log("Sign?:$isSignedIn");
            return (!_amplifyConfigured)
                ? Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : FutureBuilder<bool>(
                    future: currentUser(ctx),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data == false)
                        return LoginPage(
                          loginRepo: _loginRepository,
                          userConfigRepository: _userConfigRepository,
                        );
                      return NavigatorPage(
                          userRepository: _userConfigRepository,databaseRepository: _databaseRepository,);
                    });
          },
        ),
      ),
      routes: {
        LoginPage.routeName: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (_) => AuthBloc(_loginRepository),
                ),
                BlocProvider(create: (_) => UserBloc(_userConfigRepository,_databaseRepository)),
                BlocProvider(create: (_) => AdvertiserBloc(_databaseRepository)),
                BlocProvider(create: (_)=>CuratedListBloc(_databaseRepository)),
                   BlocProvider(create: (_)=>BannerBloc(_databaseRepository)),
                      BlocProvider(create: (_)=>GraphBloc(_databaseRepository)),
                        BlocProvider(create: (_)=>RecentPaymentBloc(_databaseRepository)),
                        BlocProvider(create: (_)=>PendingServiceBloc(_databaseRepository))

              ],
              child: LoginPage(
                loginRepo: _loginRepository,
                userConfigRepository: _userConfigRepository,
              ),
            ),
        HomePage.routeName: (_) => BlocProvider<UserBloc>(
              create: (_) => UserBloc(_userConfigRepository,_databaseRepository),
              child: HomePage(
                  userRepository: _userConfigRepository,
                  email: userDetails["email"] ?? ""),
            ),
        Coupons.routeName: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<UserBloc>(
                    create: (_) =>
                        UserBloc(_userConfigRepository, _databaseRepository),
                  ),
                  BlocProvider<FavoritesBloc>(
                      create: (_) => FavoritesBloc(_databaseRepository)),
                  BlocProvider<CouponsBloc>(
                      create: (_) => CouponsBloc(_databaseRepository)),
                ],
                child: Coupons(
                  databaseRepo: _databaseRepository,
                ))
        // Coupons.routeName: (_) => BlocProvider<UserBloc>(
        //   create: (_) => UserBloc(_userConfigRepository,_databaseRepository),
        //   child: Coupons(databaseRepo: _databaseRepository,),
        // ),
      },
    );
  }
}
