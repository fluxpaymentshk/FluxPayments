import 'package:flutter/material.dart';
import 'package:flux_payments/config/size_config.dart';

class BillTile extends StatelessWidget {
  const BillTile(
      {Key? key, required this.title, required this.desc, required this.amount})
      : super(key: key);
  final String title, desc, amount; //implement
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier*1.2),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier*0.8),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier*0.9),
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.heightMultiplier*0.9),
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ),
        elevation: 5,
      ),
    );
  }
}
