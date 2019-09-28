import 'package:flutter/material.dart';
import './chat/Friends.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Nav bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.black,
      ),
      home: Friends(),
    );
  }
}