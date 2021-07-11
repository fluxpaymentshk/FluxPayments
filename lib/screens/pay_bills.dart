// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flux_payments/bloc/bill_bloc/bill_bloc.dart';
// import 'package:flux_payments/bloc/bill_bloc/bill_event.dart';
// import 'package:flux_payments/bloc/bill_bloc/bill_state.dart';
// import 'package:flux_payments/models/user_model.dart';

// import 'bill_tile.dart';

// class PayBills extends StatelessWidget {

//   const PayBills({Key? key}) : super(key: key);
//   final String route = 'PayBills';

//   @override
//   Widget build(BuildContext context) {
//       BlocProvider.of<BillsBloc>(context).add(LoadBills());
//     List<Bills> bills = [];
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Pay Bills',
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             // SizedBox(
//             //   height: 10,
//             // ),
//             // ///////////////////////////////
//             BlocBuilder<BillsBloc,BillsState>(
//                // future: getBillData(bills),
//                 builder: (context, state) {
//                   if (state is LoadedBills) {
//                     List<Bills> bills = state.bills;

//                     return

//                         //     SizedBox(
//                         //   height:400,width:200,
//                         Expanded(
//                       // height: 90,
//                       //    child: Expanded(

//                       child: ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           physics: AlwaysScrollableScrollPhysics(),
//                           // shrinkWrap: true,
//                           itemCount: bills.length,
//                           itemBuilder: (context, int index) {
//                             return BillTile(
//                               amount: bills[index].amount.toString() ,
//                               title: bills[index].title??' Title here',
//                               desc: bills[index].desc??' Title description',
//                             );
//                           }),
//                       //   ),
//                     );
//                     // } else if (state is FetchErrorState) {
//                     //   return Card(
//                     //     child: Center(
//                     //       child: Text('Sorry,Unable to fetch News'),
//                     //     ),
//                     //   );
//                   } else {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                 })
//             //  ),
//             //   Text('HELLLOIII'),
//           ],
//         ),
//       ),

//       //  bottomNavigationBar:BottomNavigator(),
//     );
//   }
// }
