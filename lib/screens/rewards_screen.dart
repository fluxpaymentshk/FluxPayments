// import 'package:flutter/material.dart';
// import 'package:flux_payments/screens/rewards_search_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RewardsScreen extends StatefulWidget {
//   const RewardsScreen({Key? key}) : super(key: key);

//   @override
//   _RewardsScreenState createState() => _RewardsScreenState();
// }

// class _RewardsScreenState extends State<RewardsScreen> {
//   var color1 = Color(0xFF7041EE);
//   var color = Color(0xFFE9E9FF);
//   var bordercolor = (Colors.grey[700])!;
//   final Shader linearGradientText = LinearGradient(
//     colors: <Color>[Color(0xFF7041EE), Color(0xffE9D9FB)],
//   ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "Flux.",
//                 style: GoogleFonts.montserrat(
//                   fontSize: size.height * 0.07,
//                   fontWeight: FontWeight.bold,
//                   foreground: Paint()..shader = linearGradientText,
//                   // textStyle:
//                   //     TextStyle(color: Colors.blue, letterSpacing: .5),
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * 0.06,
//               padding: EdgeInsets.symmetric(
//                   horizontal: size.width * 0.01, vertical: size.height * 0.002),
//               margin: EdgeInsets.fromLTRB(
//                   size.width * 0.05, size.height * 0.01, size.width * 0.05, 0),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade500,
//                     blurRadius: size.width * 0.005,
//                     spreadRadius: size.width * 0.002,
//                     offset: Offset(size.width * 0.007, size.height * 0.005),
//                   ),
//                 ],
//                 border: Border.all(
//                   color: color1,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//                 color: color,
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   print("_+++__________++++++++++++++_________");
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) => RewardsSearchScreen()),
//                   );
//                 },
//                 child: TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(
//                       color: color1,
//                     ),
//                     hintText: "Search for my favorite brand",
//                     prefixIcon: Icon(
//                       Icons.search,
//                       size: size.height * 0.05,
//                       color: color1,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             Text("Rewards Screen"),
//           ],
//         ),
//       ),
//     );
//   }
// }
