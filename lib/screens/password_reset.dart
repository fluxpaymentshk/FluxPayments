import 'package:flutter/material.dart';

class PasswordRest extends StatelessWidget {
  const PasswordRest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Password Change'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Old Password',
                  hintText: '******',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                  hintText: '******',
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 35,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(1)),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(

                      //     context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: Text(
                      'Reset Pssword',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
