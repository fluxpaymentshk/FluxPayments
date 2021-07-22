import 'package:flutter/material.dart';
import 'package:flux_payments/widgets/back_button.dart';

class CouponDetailScreen extends StatefulWidget {
  const CouponDetailScreen({Key? key}) : super(key: key);

  @override
  _CouponDetailScreenState createState() => _CouponDetailScreenState();
}

class _CouponDetailScreenState extends State<CouponDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: backButton(context, "couponDetailsButton"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/burger.png",
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffFAD7A1), Color(0xffE96D71)],
                  ),
                ),
                // child: ,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.red,
                  height: 100,
                );
              },
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
