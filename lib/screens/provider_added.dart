import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/logo_with_back_button.dart';

class ProviderAdded extends StatefulWidget {
  const ProviderAdded({Key? key}) : super(key: key);

  @override
  _ProviderAddedState createState() => _ProviderAddedState();
}

class _ProviderAddedState extends State<ProviderAdded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            logoWithBackButton(context),

            //   Center(child: Text('SUCCESSS!!!'),),

            Center(child: Image.asset('assets/images/success.png')),

            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 3),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: gradientButton(context, 'Continue')),
                )),
          ],
        ),
      ),
    );
  }
}
