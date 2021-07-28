import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
<<<<<<< HEAD
import 'package:flux_payments/screens/rewards_screen.dart';
=======
import 'package:flux_payments/screens/bill_payment.dart';
import 'package:flux_payments/screens/gift_page.dart';
import 'package:flux_payments/screens/reward_partners.dart';
>>>>>>> b96a617a7f5fdc39bdc31981f54b9a48b2e77b50
import 'package:flux_payments/screens/support_bot_screen.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:tuple/tuple.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';
import 'profile_page.dart';

class NavigatorPage extends StatefulWidget {
  static const routeName = '/nav';
  final String email;
  final UserConfigRepository? userRepository;
  final DatabaseRepository? databaseRepository;
  const NavigatorPage(
      {Key? key,
      @required this.userRepository,
      @required this.databaseRepository,
      this.email = ""})
      : super(key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late List<Tuple2> _pages = [];
  bool isOpened = false;
  double botScreenHeightRatio = 0.8;
  double activeIconElevation = 4;
  TextStyle navigationBarTextStyle =
      GoogleFonts.rubik(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _pages = [
<<<<<<< HEAD
      Tuple2('payment', ProfilePage()),
      Tuple2('home', HomePage(userRepository: widget.userRepository)),
      Tuple2("Rewards", RewardsScreen())
=======
      
      // Tuple2('payment', PayBills()),
      Tuple2('payment', BillPayment(userRepository: widget.userRepository,databaseRepository:widget.databaseRepository)),
      Tuple2('home', HomePage(userRepository: widget.userRepository,databaseRepository:widget.databaseRepository)),
      // Tuple2('gift', giftPage()),
      Tuple2("Rewards", RewardPartnerScreen())
>>>>>>> b96a617a7f5fdc39bdc31981f54b9a48b2e77b50
    ];
  }

  int _selectedPage = 0;

  PageController _pageController = PageController();
  final controller = SheetController();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    double headerHeight = MediaQuery.of(context).size.height * 0.08;
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SlidingSheet(
            duration: const Duration(milliseconds: 900),
            controller: controller,
            color: Color(0xffF6F6FF),
            elevation: 4,
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
=======
    print(_pages);
    print('//////////////');
    return LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return Scaffold(
          body: PageView(
            children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
>>>>>>> b96a617a7f5fdc39bdc31981f54b9a48b2e77b50
            },
            controller: _pageController,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: 'payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: 'gift',
              ),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              setState(() {
                _selectedPage = index;
    
                _pageController.animateToPage(_selectedPage,
                    duration: Duration(milliseconds: 300), curve: Curves.linear);
              });
            },
          ),
        );
      }
    );
  }
}
