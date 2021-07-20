import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
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
  const NavigatorPage(
      {Key? key, @required this.userRepository, this.email = ""})
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
      Tuple2('payment', HomePage(userRepository: widget.userRepository)),
      Tuple2('home', ProfilePage()),
      Tuple2("Rewards", RewardPartnerScreen())
    ];
  }

  int _selectedPage = 0;

  PageController _pageController = PageController();
  final controller = SheetController();

  @override
  Widget build(BuildContext context) {
  double headerHeight = MediaQuery.of(context).size.height*0.08;
    return Scaffold(
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
  }

  Widget _bottomNavigationBarWidget(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffF6F6FF),
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/my_bills.png"),
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              child: ImageIcon(
                AssetImage("assets/icons/my_bills.png"),
                color: Color(0xff7041EE),
                size: 30,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          label: 'MY BILLS',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/home.png"),
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              child: ImageIcon(
                AssetImage("assets/icons/home.png"),
                color: Color(0xff7041EE),
                size: 30,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/favorites.png"),
          ),
          activeIcon: Material(
            elevation: 3,
            shape: CircleBorder(),
            child: CircleAvatar(
              child: ImageIcon(
                AssetImage("assets/icons/favorites.png"),
                color: Color(0xff7041EE),
                size: 30,
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
}
