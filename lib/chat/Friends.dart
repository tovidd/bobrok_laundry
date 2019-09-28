import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Friends extends StatefulWidget {
  Friends({Key key}) : super(key: key);

  @override
  FriendsState createState() => FriendsState();
}

class FriendsState extends State<Friends> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Friends'),
    Text('Store'),
    Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Friends", style: TextStyle(color: Colors.black))),
      body: new Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("Friends")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text("Store")),
          BottomNavigationBarItem(
              icon: Icon(Icons.voicemail), title: Text("Settings")),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
