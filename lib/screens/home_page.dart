import 'package:fintech/screens/password_reset.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Payments',
      style: optionStyle,
    ),
    Text(
      'Index 1: home',
      style: optionStyle,
    ),
    Text(
      'Index 2:gift',
      style: optionStyle,
    ),
    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      // body:Center(
      //  // child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: Column(
        //  mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 35,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PasswordRest()));
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'payment',
            //  backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            //  backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'gift',
            // backgroundColor: Colors.purple,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          //   backgroundColor: Colors.pink,
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(title: Text('Homepage',),),
// body: Column(

// //  mainAxisSize: MainAxisSize.max,
//   children: [
//     SizedBox(height:250,),
//        Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           height: 35,
//           width: 220,
//           decoration: BoxDecoration(
//               color: Colors.blue, borderRadius: BorderRadius.circular(1)),
//           child: TextButton(
//             onPressed: () {
//               Navigator.push(

//                   context, MaterialPageRoute(builder: (_) => PasswordRest()));
//             },
//             child: Text(
//               'Change Password',
//               style: TextStyle(color: Colors.white, fontSize: 17),
//             ),
//           ),
//         ),
//       ),
//     ),

//   ],
// ),

//   //    bottomNavigationBar: BottomNavigationBar(
//   //   items: const <BottomNavigationBarItem>[
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.call),
//   //       label: 'Calls',
//   //     ),
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.camera),
//   //       label: 'Camera',
//   //     ),
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.chat),
//   //       label: 'Chats',
//   //     ),
//   //   ],
//   // ),

// //       bottomNavigationBar: new Stack(
// //         clipBehavior: Clip.none,
// //         alignment: new FractionalOffset(.5, 1.0),
// //         children: [
// //           Container(
// //             height: 40.0,
// //             // width: 50,
// //             color: Colors.red,
// //           ),
// //           Row(
// //             children: [
// //               // IconButton(onPressed: (){}, icon: Icons.payment,),
// //               Align(
// //                 alignment: Alignment.centerLeft,
// //                 child: IconButton(
// //                   onPressed: () {
// //                     print('hello world');
// //                     // You enter here what you want the button to do once the user interacts with it
// //                   },
// //                   icon: Icon(
// //                     Icons.payment,
// //                     color: Colors.white,
// //                   ),
// //                   iconSize: 20.0,
// //                 ),
// //               ),
// //  //SizedBox(width:50,),

// //              Align(
// //                  alignment: Alignment.center,
// //                 child: IconButton(
// //                   onPressed: () {
// //                     print('hello world');
// //                     // You enter here what you want the button to do once the user interacts with it
// //                   },
// //                   icon: Icon(
// //                     Icons.home,
// //                     color: Colors.white,
// //                   ),
// //                   iconSize: 20.0,
// //                 ),
// //               ),
// // // SizedBox(width:50,),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: IconButton(
// //                   onPressed: () {
// //                     print('hello world');
// //                     // You enter here what you want the button to do once the user interacts with it
// //                   },
// //                   icon: Icon(
// //                     Icons.card_giftcard,
// //                     color: Colors.white,
// //                   ),
// //                   iconSize: 20.0,
// //               ),
// //                 ),
// //             ],
// //           ),
// //           // Padding(
// //           //   padding: const EdgeInsets.only(bottom: 12.0),
// //           //   child: new FloatingActionButton(
// //           //     //notchMargin: 24.0,
// //           //     onPressed: () => print('hello world'),
// //           //     child: new Icon(Icons.arrow_back),
// //           //   ),
// //           // ),
// //         ],
// //       ),

//      );
//   }
// }

///////////////////////////////////////////////////////////////
