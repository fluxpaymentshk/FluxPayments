import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/rewards_screen.dart';
import 'package:flux_payments/screens/bill_payment.dart';
import 'package:flux_payments/screens/coupons.dart';
// import 'package:flux_payments/screens/gift_page.dart';
import 'package:flux_payments/screens/reward_partners.dart';
import 'package:flux_payments/screens/support_bot_screen.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:tuple/tuple.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class NavigatorPage extends StatefulWidget {
  static const routeName = '/nav';
  String? email;
  final UserConfigRepository? userRepository;
  final DatabaseRepository? databaseRepository;
  NavigatorPage({
    Key? key,
    @required this.userRepository,
    @required this.databaseRepository,
    this.email,
  }) : super(key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late List<Tuple2> _pages = [];
  bool isOpened = false;
  double headerHeight = 0;
  double botScreenHeightRatio = 0.8;
  double activeIconElevation = 4;
  TextStyle navigationBarTextStyle =
      GoogleFonts.rubik(fontSize: 10, fontWeight: FontWeight.bold);
  DatabaseRepository _databaseRepo = DatabaseRepository();
  final UserConfigRepository userConfigRepository = UserConfigRepository();

  // void addUser() async {
  //   var userdetails = await userConfigRepository.fetchUserDetails();
  //   print(userdetails.userSub);
  //   log("##############################################################");
  //   print("44444444444${widget.lname}44444444444444444444444444444444444444 ");
  //   log(userdetails.userSub.toString());
  //   SizeConfig.userID = userdetails.userSub!;
  //   _databaseRepo.addUserdata(
  //     email: widget.email,
  //     lname: widget.lname,
  //     fname: widget.fname,
  //     phnNumber: widget.phnNumber,
  //     hkID: widget.hkID,
  void initState() {
    super.initState();
    //  headerHeight = MediaQuery.of(context).size.height * 0.1;
    _pages = [
      // Tuple2('payment', PayBills()),
      //Tuple2('payment', BillPayment(userRepository: widget.userRepository,databaseRepository:widget.databaseRepository)),
      Tuple2(
          'Payment',
          BillPayment(
              userRepository: widget.userRepository,
              databaseRepository: widget.databaseRepository)),
      Tuple2(
          'home1',
          HomePage(
              userRepository: widget.userRepository,
              databaseRepository: widget.databaseRepository)),
      // Tuple2('gift', giftPage()),
      Tuple2(
          "Coupons",
          Coupons(
            databaseRepo: widget.databaseRepository,
          ))
    ];
  }

  int _selectedPage = 1;

  PageController _pageController = PageController();
  final controller = SheetController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      headerHeight = SizeConfig.heightMultiplier * 11;

      return Scaffold(
        floatingActionButton:isOpened?null: Container(
          margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.8,left:MediaQuery.of(context).size.width*0.385,),
          child: TextButton(
            child: ImageIcon(
              AssetImage("assets/icons/up_icon.png"),
              size: 20,
            ),
            onPressed: null,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        bottomNavigationBar: SafeArea(
          child: SlidingSheet(
              duration: const Duration(milliseconds: 900),
              controller: controller,
              color: Color(0xffF6F6FF),
              elevation: 0,
              maxWidth: 500,
              cornerRadius: 21,
              cornerRadiusOnFullscreen: 0.0,
              closeOnBackdropTap: true,
              closeOnBackButtonPressed: true,
              isBackdropInteractable: true,
              snapSpec: SnapSpec(
                snap: true,
                positioning: SnapPositioning.relativeToAvailableSpace,
                snappings: [SnapSpec.headerFooterSnap, 0.9],
                onSnap: (state, snap) {
                  print('Snapped to $snap');
                  if (snap != null && snap >= 0.5) {
                    setState(() {
                      isOpened = true;
                    });
                  } else {
                    setState(() {
                      isOpened = false;
                    });
                  }
                },
              ),
              parallaxSpec: const ParallaxSpec(
                enabled: true,
                amount: 0.35,
                endExtent: 0.6,
              ),
              liftOnScrollHeaderElevation: 12.0,
              liftOnScrollFooterElevation: 12.0,
              body: PageView(
                children:
                    _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
                onPageChanged: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                controller: _pageController,
              ),
              builder: (BuildContext context, SheetState state) {
                return Container(
                  height:
                      MediaQuery.of(context).size.height * botScreenHeightRatio,
                  child: SupportBotScreen(),
                );
              },
              headerBuilder: (context, state) {
                log(state.extent.toString());
                if (isOpened)
                  return Container(
                    height: headerHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Color(0xffF2F2FF),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4.5),
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage(
                          "assets/icons/down_icon.png",
                        ),
                      ),
                      onPressed: controller.collapse,
                    ),
                  );
                return Container(
                  height: headerHeight,
                  child: _bottomNavigationBarWidget(context),
                );
              }),
        ),
      );
    });
  }

  Widget _bottomNavigationBarWidget(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffF6F6FF),
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/my_bills.png"),
            size: 26,
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 18,
              child: ImageIcon(
                AssetImage("assets/icons/my_bills.png"),
                color: Color(0xff7041EE),
                size: 17.2,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          label: 'MY BILLS',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/home.png"),
            size: 26,
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 18,
              child: ImageIcon(
                AssetImage("assets/icons/home.png"),
                color: Color(0xff7041EE),
                size: 17.2,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/favorites.png"),
            size: 26,
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 18,
              child: ImageIcon(
                AssetImage("assets/icons/favorites.png"),
                color: Color(0xff7041EE),
                size: 17.2,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          label: 'REWARDS',
        ),
      ],
      currentIndex: _selectedPage,
      onTap: (index) {
        setState(
          () {
            _selectedPage = index;
            _pageController.jumpToPage(
              _selectedPage,
            );
          },
        );
      },
      showUnselectedLabels: false,
    );
  }

//  @override
  // Widget build(BuildContext context) {
  //   print(_pages);
  //   print('//////////////');
  //   return LayoutBuilder(builder: (context, constraints) {
  //       SizeConfig().init(constraints);
  //       return Scaffold(
  //         body: PageView(
  //           children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
  //           onPageChanged: (index) {
  //             setState(() {
  //               _selectedPage = index;
  //             });
  //           },
  //           controller: _pageController,
  //         ),
  //         bottomNavigationBar: BottomNavigationBar(
  //           items: const [
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.payment),
  //               label: 'payment',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.home),
  //               label: 'home',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.card_giftcard),
  //               label: 'gift',
  //             ),
  //           ],
  //           currentIndex: _selectedPage,
  //           selectedItemColor: Colors.amber[800],
  //           onTap: (index) {
  //             setState(() {
  //               _selectedPage = index;

  //               _pageController.animateToPage(_selectedPage,
  //                   duration: Duration(milliseconds: 300), curve: Curves.linear);
  //             });
  //           },
  //         ),
  //       );
  //     }
  //   );
  //  }
}
