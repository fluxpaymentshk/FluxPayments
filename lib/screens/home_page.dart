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
    
      body: Column(
      
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
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'gift',
          
          ),
        
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
