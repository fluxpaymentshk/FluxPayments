import 'package:flutter/material.dart';

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
          children: [
            Center(child: Text('SUCCESSS!!!'),),
          ],
        ),
      ),
    );
  }
  
}
