import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';


class WaitingScreen extends StatelessWidget {
  const WaitingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(child: CircularProgressIndicator(
        color: AppTheme.main,
        strokeWidth: 4.0,
      ),),
      
    );
  }
}