import 'package:flutter/material.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/gift_page.dart';
import 'package:tuple/tuple.dart';

import 'pay_bills.dart';
import 'home_page.dart';
import 'profile_page.dart';

class NavigatorPage extends StatefulWidget {
  static const routeName = '/nav';
  final String email;
  final UserConfigRepository? userRepository;
  const NavigatorPage(
      {Key? key, @required this.userRepository, this.email = ""})
      : super(key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late List<Tuple2> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      Tuple2('payment', HomePage(userRepository: widget.userRepository)),
      // Tuple2('payment', PayBills()),
      Tuple2('home', ProfilePage()),
      Tuple2('gift', giftPage()),
    ];
  }

  // final List<Tuple2>
  int _selectedPage = 0;

  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print(_pages);
    print('//////////////');
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
}
