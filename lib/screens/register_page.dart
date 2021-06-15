import 'package:fintech/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistPage'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'abc@xyz.com'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: '******',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
                hintText: '******',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
//SizedBox(width:200, ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 190,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
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
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
