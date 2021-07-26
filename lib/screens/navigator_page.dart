import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/bill_payment.dart';
import 'package:flux_payments/screens/gift_page.dart';
import 'package:flux_payments/screens/reward_partners.dart';
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
  TextStyle navigationBarTextStyle = GoogleFonts.rubik(fontSize: 10,fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _pages = [
      
      // Tuple2('payment', PayBills()),
      Tuple2('payment', BillPayment(userRepository: widget.userRepository,databaseRepository:widget.databaseRepository)),
      Tuple2('home', HomePage(userRepository: widget.userRepository,databaseRepository:widget.databaseRepository)),
      // Tuple2('gift', giftPage()),
      Tuple2("Rewards", RewardPartnerScreen())
    ];
  }

  int _selectedPage = 0;

  PageController _pageController = PageController();
  final controller = SheetController();

  @override
  Widget build(BuildContext context) {
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
