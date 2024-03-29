import 'package:flutter/material.dart';

import './laundry/Telepon.dart';
import './laundry/Shop.dart';

void main() {
  runApp(new MaterialApp(
    title: "Tampilan Tab Bar",
    home: new Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: new Text("Bobrok Laundry", style: TextStyle(color: Colors.black),),
      ),
      bottomNavigationBar: new TabBar(
        controller: controller,
        tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.shopping_cart),
            text: "Shop",
          ),
          new Tab(
            icon: new Icon(Icons.account_balance_wallet),
            text: "Payment",
          ),
          new Tab(
            icon: new Icon(Icons.history),
            text: "History",
          ),
          new Tab(
            icon: new Icon(Icons.settings),
            text: "Setting",
          ),
        ],
        labelColor: Colors.purple,
        indicatorWeight: 0.0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.red,
        unselectedLabelColor: Colors.lightGreenAccent[700],
        labelStyle: TextStyle(fontSize: 16.0),
        unselectedLabelStyle: TextStyle(fontSize: 12.0),
        indicator: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft, 
            end: Alignment.centerRight, 
            stops: [0.01, 0.99],
            colors: <Color>[
              Colors.lightGreenAccent, Colors.lightBlueAccent
            ],
          ),
        ),
      ),

      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new ShopScreen(), 
          new Telepon(),
          new Telepon(),
          new Telepon(),
        ],
      ),
      backgroundColor: Colors.yellow[100],
    );

  }
}
