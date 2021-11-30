import 'package:flutter/material.dart';
import 'package:peristock/DataTableDemo.dart';
import 'package:peristock/itemlist.dart';
import 'package:peristock/itemlist.dart';
import 'package:peristock/searchBook.dart';
import 'package:peristock/Login/login.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peristock',
      home: new LoginScreen()
    );
  }
}
